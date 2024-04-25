import 'package:flutter/material.dart';
import 'package:flutter_application_1/statistic/co.dart';
import 'package:flutter_application_1/statistic/lembab.dart';
import 'package:flutter_application_1/statistic/pm2.5.dart';
import 'package:flutter_application_1/statistic/suhu.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/mainpage.dart';

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
              PMPage(),
              COPage(),
              SuhuPage(),
              LembabPage(),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            index: 1,
            backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            animationDuration: const Duration(milliseconds: 300),
            items: const [
              Icon(Icons.home,
                  color: Color.fromRGBO(178, 209, 238, 1), size: 50),
              Icon(Icons.bar_chart,
                  color: Color.fromRGBO(178, 209, 238, 1), size: 50),
            ],
            onTap: (index) {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const mainpage()),
                );
              }
            },
          ),
        ),
      );
}
