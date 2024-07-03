import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Lembab extends StatefulWidget {
  const Lembab({Key? key}) : super(key: key);

  @override
  _LembabState createState() => _LembabState();
}

class _LembabState extends State<Lembab> {
  List<DataPoint> chartData = [];
  Timer? _timer;
  double globalCurrentSensorValue = 0;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), _generateTrace);
  }

  _generateTrace(Timer t) {
    if (mounted) {
      setState(() {
        chartData.add(DataPoint(DateTime.now(), globalCurrentSensorValue));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
      body: Container(
        alignment: Alignment.topCenter,
        height: 590,
        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: buildStreamBuilder(),
      ),
    );
  }

  Widget buildStreamBuilder() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('EspData').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          );
        } else {
          var documents = snapshot.data?.docs ?? [];
          for (var f in documents) {
            if (f.id == 'DHT11') {
              print('current Lembab = ${f['Humidity']}');
              globalCurrentSensorValue = double.parse(f['Humidity']);
            }
          }

          return Center(
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(),
              primaryYAxis:
                  NumericAxis(minimum: 0, maximum: 100, opposedPosition: true),
              series: <ChartSeries>[
                LineSeries<DataPoint, DateTime>(
                  dataSource: chartData,
                  xValueMapper: (DataPoint data, _) => data.time,
                  yValueMapper: (DataPoint data, _) => data.value,
                  width: 5,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class DataPoint {
  final DateTime time;
  final double value;

  DataPoint(this.time, this.value);
}
