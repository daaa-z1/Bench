import sys
import u6
from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QObject, QTimer, pyqtProperty, pyqtSlot, pyqtSignal
from PyQt5.QtQml import QQmlApplicationEngine

class MainApp(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.d = u6.U6()
        self.daftar_ain = [(0, 1)]
        self.daftar_min = [(-10, -10)]
        self.daftar_max = [(10, 10)]
        self.daftar_min_scale = [(-10, -10)]
        self.daftar_max_scale = [(10, 10)]
        self.keys = ['reff_v', 'aktual']
        self._parameter = {key: {'minValue': self.daftar_min[0][i], 'maxValue': self.daftar_max[0][i], 'minScale': self.daftar_min_scale[0][i], 'maxScale': self.daftar_max_scale[0][i]} for i, key in enumerate(self.keys)}
        self._value = {}

        self.timer = QTimer()
        self.timer.timeout.connect(self.readValues)
        self.timer.start(100)
    
    valueChanged = pyqtSignal()
    @pyqtProperty('QVariantMap', notify=valueChanged)
    def value(self):
        return self._value

    @value.setter
    def value(self, val):
        self._value = val
        self.valueChanged.emit()

    @pyqtSlot()
    def readValues(self):
        value = [self.d.getAIN(ain) for ain in self.daftar_ain[0]]
        min_scale = self.daftar_min_scale[0]
        max_scale = self.daftar_max_scale[0]
        min_values = self.daftar_min[0]
        max_values = self.daftar_max[0]
        calculated_values = [(max_values[i] - min_values[i]) / (max_scale[i] - min_scale[i]) * (value[i] - min_scale[i] + min_values[i]) for i in range(len(value))]
        calculated_values = [max(min(value, max_val), min_val) for value, max_val, min_val in zip(calculated_values, max_values, min_values)]
        calculated_values = [int(value) for value in calculated_values]
        self.value = {key: calculated_values[i] for i, key in enumerate(self.keys)}

if __name__ == "__main__":
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    mainApp = MainApp()
    ctx = engine.rootContext()
    print(mainApp._parameter)
    ctx.setContextProperty("mainApp", mainApp)
    engine.load('main.qml')
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())