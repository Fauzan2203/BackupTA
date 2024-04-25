import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LembabPage extends StatefulWidget {
  const LembabPage({super.key});

  @override
  State<LembabPage> createState() => _LembabPageState();
}

class _LembabPageState extends State<LembabPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final _tabs = [
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
    _tabController = TabController(length: 3, vsync: this);
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
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(80),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: _tabs,
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
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              height: 400,
              width: 400,
              child: _LineChart(
                data: _tabController.index == 0
                    ? _data1
                    : _tabController.index == 1
                        ? _data2
                        : _data3,
              ),
            ),
          ]),
        ));
  }
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
    maxY: 5,
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
    maxY: 5,
  );
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
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: const AxisTitles(
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
      text = '10';
      break;
    case 2:
      text = '20';
      break;
    case 3:
      text = '30';
      break;
    case 4:
      text = '40';
      break;
    case 5:
      text = '50';
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

SideTitles get rightTitles => const SideTitles(
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

SideTitles get bottomTitles => const SideTitles(
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
  spots: const [
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
  spots: const [
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
  spots: const [
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
