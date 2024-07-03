import 'package:flutter/foundation.dart';
import 'pm2.5.dart';

class ChartDataProvider with ChangeNotifier {
  List<DataPoint> _chartData = [];
  double _globalCurrentSensorValue = 0;

  List<DataPoint> get chartData => _chartData;
  double get globalCurrentSensorValue => _globalCurrentSensorValue;

  void addDataPoint(DataPoint dataPoint) {
    _chartData.add(dataPoint);
    notifyListeners();
  }

  void setGlobalCurrentSensorValue(double value) {
    _globalCurrentSensorValue = value;
    notifyListeners();
  }
}
