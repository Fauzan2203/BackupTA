import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Lembab2 extends StatefulWidget {
  const Lembab2({Key? key}) : super(key: key);

  @override
  _Lembab2State createState() => _Lembab2State();
}

class _Lembab2State extends State<Lembab2> {
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
                        FlSpot(0, 22),
                        FlSpot(1, 44),
                        FlSpot(2, 2),
                        FlSpot(3, 45),
                        FlSpot(4, 60),
                        FlSpot(5, 46),
                        FlSpot(6, 10),
                        FlSpot(7, 44),
                        FlSpot(8, 20),
                        FlSpot(9, 45),
                        FlSpot(10, 60),
                        FlSpot(11, 46),
                        FlSpot(12, 10),
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
                  maxX: 12,
                  minY: 0,
                  maxY: 100,
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
                      axisNameWidget: const Text('Jam'),
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          String text = '';
                          switch (value.toInt()) {
                            case 1:
                              text = '1';
                              break;
                            case 2:
                              text = '2';
                              break;
                            case 3:
                              text = '3';
                              break;
                            case 4:
                              text = '4';
                              break;
                            case 5:
                              text = '5';
                              break;
                            case 6:
                              text = '6';
                              break;
                            case 7:
                              text = '7';
                              break;
                            case 8:
                              text = '8';
                              break;
                            case 9:
                              text = '9';
                              break;
                            case 10:
                              text = '10';
                              break;
                            case 11:
                              text = '11';
                              break;
                            case 12:
                              text = '12';
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
                            case 60:
                              text = '60';
                              break;
                            case 70:
                              text = '70';
                              break;
                            case 80:
                              text = '80';
                              break;
                            case 90:
                              text = '90';
                              break;
                            case 100:
                              text = '100';
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
