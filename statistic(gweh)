import 'package:flutter/material.dart';
import 'package:flutter_application_1/statistic/co.dart';
import 'package:flutter_application_1/statistic/lembab.dart';
import 'package:flutter_application_1/statistic/pm2.5.dart';
import 'package:flutter_application_1/statistic/suhu.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Statistic'),
            centerTitle: true,
            automaticallyImplyLeading: false,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'PM2.5'),
                Tab(text: 'CO'),
                Tab(text: 'Suhu'),
                Tab(text: 'Kelembaban'),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          body: const TabBarView(
            children: [
              PM25(),
              CO(),
              Suhu(),
              Lembab(),
            ],
          ),
        ),
      );
}
