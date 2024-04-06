import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/mainpage.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabController2;
  final _tabs = [
    const Tab(text: 'PM 2.5'),
    const Tab(text: 'CO'),
    const Tab(text: 'Suhu'),
    const Tab(text: 'Kelembaban'),
  ];
  final _tabs2 = [
    const Tab(text: '1 Jam'),
    const Tab(text: '12 Jam'),
    const Tab(text: '24 Jam'),
  ];

  late LineChartData _data1;
  late LineChartData _data2;
  late LineChartData _data3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController2 = TabController(length: 3, vsync: this);
    _tabController.index = 0;

    final gridData = getGridData();
    final titlesData = getTitlesData();
    final boarderData = getBoarderData();

    _data1 = getSampleData1(gridData, titlesData, boarderData);
    _data2 = getSampleData2(gridData, titlesData, boarderData);
    _data3 = getSampleData3(gridData, titlesData, boarderData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(80),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: _tabs,
                labelColor: Colors.black,
                labelStyle: const TextStyle(fontSize: 15),
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TabBar(
                controller: _tabController2,
                tabs: _tabs2,
                labelColor: Colors.black,
                labelStyle: const TextStyle(fontSize: 18),
                unselectedLabelColor: Colors.black,
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
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              height: 400,
              width: 400,
              child: _LineChart(
                data: _tabController2.index == 0
                    ? _data1
                    : _tabController2.index == 1
                        ? _data2
                        : _data3,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, color: Color.fromRGBO(178, 209, 238, 1), size: 50),
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
    );
  }

  LineChartData getSampleData1(
      FlGridData gridData, FlTitlesData titlesData, FlBorderData boarderData) {
    return LineChartData(
      gridData: gridData,
      titlesData: titlesData,
      borderData: boarderData,
      lineBarsData: LineBarsData1,
      minX: 0,
      maxX: 25,
      minY: 0,
      maxY: 5,
    );
  }

  LineChartData getSampleData2(
      FlGridData gridData, FlTitlesData titlesData, FlBorderData boarderData) {
    return LineChartData(
      gridData: gridData,
      titlesData: titlesData,
      borderData: boarderData,
      lineBarsData: LineBarsData2,
      minX: 0,
      maxX: 25,
      minY: 0,
      maxY: 10,
    );
  }

  LineChartData getSampleData3(
      FlGridData gridData, FlTitlesData titlesData, FlBorderData boarderData) {
    return LineChartData(
      gridData: gridData,
      titlesData: titlesData,
      borderData: boarderData,
      lineBarsData: LineBarsData3,
      minX: 0,
      maxX: 25,
      minY: 0,
      maxY: 15,
    );
  }
}

class _LineChart extends StatelessWidget {
  final LineChartData data;

  const _LineChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return LineChart(data);
  }
}

FlTitlesData getTitlesData() {
  return FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: AxisTitles(
      sideTitles: rightTitles,
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );
}

Widget rightTitlesWidget(double value, TitleMeta meta) {
  const style =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey);
  String text;
  switch (value.toInt()) {
    case 1:
      text = '1m';
      break;
    case 2:
      text = '2m';
      break;
    case 3:
      text = '3m';
      break;
    case 4:
      text = '4m';
      break;
    case 5:
      text = '5m';
      break;
    default:
      return Container();
  }
  return Text(
    text,
    style: style,
    textAlign: TextAlign.center,
  );
}

SideTitles get rightTitles => SideTitles(
    getTitlesWidget: rightTitlesWidget,
    showTitles: true,
    interval: 1,
    reservedSize: 40);

Widget bottomTitlesWidget(double value, TitleMeta meta) {
  const style =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey);
  Widget text;
  switch (value.toInt()) {
    case 5:
      text = const Text('15', style: style);
      break;
    case 10:
      text = const Text('30', style: style);
      break;
    case 15:
      text = const Text('45', style: style);
      break;
    case 20:
      text = const Text('60', style: style);
      break;
    default:
      text = const Text('');
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 6,
    child: text,
  );
}

SideTitles get bottomTitles => SideTitles(
      showTitles: true,
      interval: 1,
      getTitlesWidget: bottomTitlesWidget,
    );

FlGridData getGridData() {
  return FlGridData(show: true);
}

FlBorderData getBoarderData() {
  return FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(color: Colors.grey, width: 4),
        left: BorderSide(color: Colors.transparent),
        right: BorderSide(color: Colors.transparent),
        top: BorderSide(color: Colors.transparent),
      ));
}

final LineChartBarData barData1 = LineChartBarData(
  spots: [
    FlSpot(0, 3),
    FlSpot(2.6, 2),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 4),
  ],
  isCurved: true,
  color: Colors.red,
  barWidth: 5,
  isStrokeCapRound: true,
  belowBarData: BarAreaData(show: false),
);

final LineChartBarData barData2 = LineChartBarData(
  spots: [
    FlSpot(0, 1),
    FlSpot(2.6, 3),
    FlSpot(4.9, 4),
    FlSpot(6.8, 2),
    FlSpot(8, 3.5),
    FlSpot(9.5, 2),
    FlSpot(11, 2.5),
  ],
  isCurved: true,
  color: Colors.blue,
  barWidth: 5,
  isStrokeCapRound: true,
  belowBarData: BarAreaData(show: false),
);

final LineChartBarData barData3 = LineChartBarData(
  spots: [
    FlSpot(0, 2),
    FlSpot(2.6, 1.5),
    FlSpot(4.9, 3),
    FlSpot(6.8, 2.5),
    FlSpot(8, 3),
    FlSpot(9.5, 2),
    FlSpot(11, 2.5),
  ],
  isCurved: true,
  color: Colors.green,
  barWidth: 5,
  isStrokeCapRound: true,
  belowBarData: BarAreaData(show: false),
);

List<LineChartBarData> get LineBarsData1 => [LineChartBarData1];
List<LineChartBarData> get LineBarsData2 => [LineChartBarData2];
List<LineChartBarData> get LineBarsData3 => [LineChartBarData3];

final LineChartBarData LineChartBarData1 = LineChartBarData(
  spots: barData1.spots,
  isCurved: barData1.isCurved,
  color: Colors.black,
  barWidth: barData1.barWidth,
  isStrokeCapRound: barData1.isStrokeCapRound,
  belowBarData: barData1.belowBarData,
);

final LineChartBarData LineChartBarData2 = LineChartBarData(
  spots: barData2.spots,
  isCurved: barData2.isCurved,
  color: Colors.black,
  barWidth: barData2.barWidth,
  isStrokeCapRound: barData2.isStrokeCapRound,
  belowBarData: barData2.belowBarData,
);

final LineChartBarData LineChartBarData3 = LineChartBarData(
  spots: barData3.spots,
  isCurved: barData3.isCurved,
  color: Colors.black,
  barWidth: barData3.barWidth,
  isStrokeCapRound: barData3.isStrokeCapRound,
  belowBarData: barData3.belowBarData,
);
