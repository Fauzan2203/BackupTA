import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainpage.dart';
import 'package:flutter_application_1/setting.dart';
import 'package:flutter_application_1/statistic.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({Key? key}) : super(key: key);

  @override
  _bottomnavState createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int index = 1;

  final items = const [
    Icon(Icons.settings, color: Color.fromRGBO(178, 209, 238, 1), size: 50),
    Icon(Icons.home, color: Color.fromRGBO(178, 209, 238, 1), size: 50),
    Icon(Icons.bar_chart, color: Color.fromRGBO(178, 209, 238, 1), size: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        color: Colors.white,
        backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
        animationDuration: const Duration(milliseconds: 300),
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = Setting();
        break;
      case 1:
        widget = mainpage();
        break;
      case 2:
        widget = Statistic();
        break;
      default:
        widget = mainpage();
        break;
    }
    return widget;
  }
}
