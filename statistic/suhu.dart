import 'package:flutter/material.dart';
import 'package:flutter_application_1/statistic/linechart/suhu1.dart';
import 'package:flutter_application_1/statistic/linechart/suhu2.dart';
import 'package:flutter_application_1/statistic/linechart/suhu3.dart';

class SuhuPage extends StatefulWidget {
  const SuhuPage({super.key});

  @override
  State<SuhuPage> createState() => _SuhuPageState();
}

class _SuhuPageState extends State<SuhuPage> {
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
                      Suhu1(),
                      Suhu2(),
                      Suhu3(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
