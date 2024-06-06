import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PM3 extends StatefulWidget {
  const PM3({Key? key}) : super(key: key);

  @override
  _PM3State createState() => _PM3State();
}

class _PM3State extends State<PM3> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.only(left: 20, top: 20),
            height: 400,
            width: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: SfCartesianChart(
              primaryXAxis: NumericAxis(
                minimum: 0,
                maximum: 24,
                interval: 3,
                title: AxisTitle(text: 'Jam'),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 250,
                interval: 50,
                title: AxisTitle(text: 'Value'),
              ),
              series: <ChartSeries>[
                LineSeries<ChartData, double>(
                  dataSource: [
                    ChartData(0, 70),
                    ChartData(3, 52),
                    ChartData(6, 250),
                    ChartData(9, 121),
                    ChartData(12, 44),
                    ChartData(15, 200),
                    ChartData(18, 230),
                    ChartData(21, 70),
                    ChartData(24, 36),
                  ],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  color: Colors.blue,
                  width: 2,
                  markerSettings: MarkerSettings(isVisible: true),
                )
              ],
            ),
          ),
        ),
      );
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}
