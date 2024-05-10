import 'package:flutter/material.dart';
import 'package:flutter_application_1/statistic/linechart/co1.dart';
import 'package:flutter_application_1/statistic/linechart/co2.dart';
import 'package:flutter_application_1/statistic/linechart/co3.dart';

class COPage extends StatefulWidget {
  const COPage({super.key});

  @override
  State<COPage> createState() => _COPageState();
}

class _COPageState extends State<COPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: TabBar(
                    tabs: const [
                      Tab(text: '1 Jam'),
                      Tab(text: '12 Jam'),
                      Tab(text: '24 jam'),
                    ],
                    indicator: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    onTap: (index) {
                      setState(() {});
                    },
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      CO1(),
                      CO2(),
                      CO3(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
