import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PM2 extends StatefulWidget {
  const PM2({Key? key}) : super(key: key);

  @override
  State<PM2> createState() => _PM2State();
}

class _PM2State extends State<PM2> {
  List<FlSpot> _pmSpots = [];

  @override
  void initState() {
    super.initState();
    _fetchPMValues();
  }

  void _fetchPMValues() {
    FirebaseFirestore.instance
        .collection('EspData')
        .doc('pm12h')
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        if (data != null) {
          List<FlSpot> newSpots = [];
          for (int i = 0; i < 13; i++) {
            String fieldName = 'PM25_$i';
            if (data.containsKey(fieldName)) {
              double value = double.tryParse(data[fieldName].toString()) ?? 0.0;
              newSpots.add(FlSpot(i.toDouble(), value));
            }
          }
          setState(() {
            _pmSpots = newSpots;
          });
          // Debug: Print the spots to ensure they are correct
          print('Fetched PM spots: $_pmSpots');
        }
      } else {
        print('Document does not exist');
      }
    }, onError: (error) {
      print("Failed to fetch PM values: $error");
    });
  }

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
                bottomRight: Radius.circular(50),
              ),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: _pmSpots,
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
                            case 0:
                              text = '0';
                              break;
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
