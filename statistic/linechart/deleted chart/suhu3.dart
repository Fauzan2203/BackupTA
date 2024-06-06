import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Suhu3 extends StatefulWidget {
  const Suhu3({Key? key}) : super(key: key);

  @override
  _Suhu3State createState() => _Suhu3State();
}

class _Suhu3State extends State<Suhu3> {
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
                  bottomRight: Radius.circular(50)), // Border container
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 29),
                        FlSpot(10, 41),
                        FlSpot(20, 1),
                        FlSpot(30, 38),
                        FlSpot(40, 11),
                        FlSpot(50, 16),
                        FlSpot(60, 7),
                      ],
                      isCurved: true,
                      dotData: const FlDotData(show: true),
                      color: Colors.blue,
                      barWidth: 5,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                    ),
                  ],
                  minX: 0,
                  maxX: 60,
                  minY: 0,
                  maxY: 50,
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.transparent),
                      left: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      /*axisNameWidget: const Text('Menit'),*/
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          String text = '';
                          switch (value.toInt()) {
                            case 0:
                              text = '0';
                              break;
                            case 10:
                              text = '10';
                              break;
                            case 20:
                              text = '20';
                              break;
                            case 30:
                              text = '30';
                              break;
                            case 40:
                              text = '40';
                              break;
                            case 50:
                              text = '50';
                              break;
                            case 60:
                              text = '';
                              break;
                          }
                          return Text(text);
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      /*axisNameWidget: const Text('Value'),*/
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          String text = '';
                          switch (value.toInt()) {
                            case 10:
                              text = '10';
                              break;
                            case 20:
                              text = '20';
                              break;
                            case 30:
                              text = '30';
                              break;
                            case 40:
                              text = '40';
                              break;
                            case 50:
                              text = '50';
                              break;
                          }
                          return Text(text);
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
