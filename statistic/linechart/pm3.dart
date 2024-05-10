import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
            child: AspectRatio(
              aspectRatio: 1,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 70),
                        FlSpot(3, 52),
                        FlSpot(6, 480),
                        FlSpot(9, 121),
                        FlSpot(12, 44),
                        FlSpot(15, 200),
                        FlSpot(18, 302),
                        FlSpot(21, 70),
                        FlSpot(24, 36),
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
                  maxX: 24,
                  minY: 0,
                  maxY: 500,
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
                            case 5:
                              text = '5';
                              break;
                            case 10:
                              text = '10';
                              break;
                            case 15:
                              text = '15';
                              break;
                            case 20:
                              text = '20';
                              break;
                            case 24:
                              text = '24';
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
                            case 50:
                              text = '50';
                              break;
                            case 100:
                              text = '100';
                              break;
                            case 150:
                              text = '150';
                              break;
                            case 200:
                              text = '200';
                              break;
                            case 250:
                              text = '250';
                              break;
                            case 300:
                              text = '300';
                              break;
                            case 350:
                              text = '350';
                              break;
                            case 400:
                              text = '400';
                              break;
                            case 450:
                              text = '450';
                              break;
                            case 500:
                              text = '500';
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
