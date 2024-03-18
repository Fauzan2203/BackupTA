import 'package:flutter/material.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> with TickerProviderStateMixin {
  late TabController _tabController;
  final _tabs = [
    const Tab(text: '1 Jam'),
    const Tab(text: '12 Jam'),
    const Tab(text: '24 Jam'),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(80),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: _tabs,
                labelColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 18),
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(80)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
