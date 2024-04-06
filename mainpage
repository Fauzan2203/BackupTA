import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/statistic.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  bool _showSlider = false;
  bool _isPowerOn = false;

  void _onItemTapped(int index) {
    setState(() {});

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Statistic()),
      );
    } else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => mainpage()),
      );
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.transparent,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        onTap: _onItemTapped,
        items: const [
          Icon(
            Icons.home,
            color: Color.fromRGBO(178, 209, 238, 1),
            size: 50,
          ),
          Icon(
            Icons.bar_chart,
            color: Color.fromRGBO(178, 209, 238, 1),
            size: 50,
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 255),
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(fontFamily: "Raleway"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 280,
              height: 280,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(160, 199, 235, 1),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    blurRadius: 2.0,
                    offset: Offset(0.0, 1.5),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 64),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  shape: BoxShape.circle,
                ),
                child: const Column(
                  children: [
                    Text(
                      '50',
                      style: TextStyle(
                        color: Color.fromRGBO(160, 199, 235, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                        height: 0.95,
                        shadows: [
                          Shadow(
                            color: Colors.black12,
                            offset: Offset(-2, -2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'PM2.5',
                      style: TextStyle(
                        color: Color.fromRGBO(160, 199, 235, 1),
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 400,
              height: 100,
              margin: const EdgeInsets.only(top: 16, bottom: 16),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(178, 209, 238, 1),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    blurRadius: 2,
                    offset: Offset(0.0, 1.5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(160, 199, 235, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('EspData')
                              .doc('DHT11')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasData && snapshot.data!.exists) {
                              // Access the data from the document
                              Map<String, dynamic>? data = snapshot.data!.data()
                                  as Map<String, dynamic>?;

                              if (data != null) {
                                // Access the specific fields
                                String tempValue = data['Temperature'] ?? '0.0';
                                double temperature =
                                    double.tryParse(tempValue) ?? 0;

                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${temperature.toInt()}°C',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black12,
                                            offset: Offset(-2, -2),
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                // Handle the case when data is null
                                return const Text('Data is null');
                              }
                            } else {
                              // Handle the case when the document doesn't exist
                              return const Text('Document does not exist');
                            }
                          },
                        ),
                        const Text(
                          'Suhu',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('EspData')
                              .doc('DHT11')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasData && snapshot.data!.exists) {
                              // Access the data from the document
                              Map<String, dynamic>? data = snapshot.data!.data()
                                  as Map<String, dynamic>?;

                              if (data != null) {
                                // Access the specific fields
                                String coValue = data['CO'] ?? '0.0';
                                double CO = double.tryParse(coValue) ?? 0;

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    '${CO.toInt()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 5,
                                          offset: const Offset(-2, -2),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                // Handle the case when data is null
                                return const Text('Data is null');
                              }
                            } else {
                              // Handle the case when the document doesn't exist
                              return const Text('Document does not exist');
                            }
                          },
                        ),
                        Text(
                          'CO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(-2, -2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(160, 199, 235, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('EspData')
                              .doc('DHT11')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasData && snapshot.data!.exists) {
                              // Access the data from the document
                              Map<String, dynamic>? data = snapshot.data!.data()
                                  as Map<String, dynamic>?;

                              if (data != null) {
                                // Access the specific field for humidity
                                String humidityValue = data['Humidity'] ??
                                    '0'; // Assuming 'Humidity' is the field name in Firestore
                                double humidity =
                                    double.tryParse(humidityValue) ?? 0;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${humidity.toInt()}%',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black12,
                                            offset: Offset(-2, -2),
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Kelembaban',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                );
                              } else {
                                // Handle the case when data is null
                                return const Text('Data is null');
                              }
                            } else {
                              // Handle the case when the document doesn't exist
                              return const Text('Document does not exist');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 400,
              height: 156,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image:
                          DecorationImage(image: AssetImage('assets/Auto.png')),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                          blurRadius: 2.0,
                          offset: Offset(0.0, 1.5),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPowerOn = !_isPowerOn;
                      });

                      int powerStateValue = _isPowerOn ? 1 : 0;

                      FirebaseFirestore.instance
                          .collection('EspData')
                          .doc('Sent From Mobile')
                          .update({'powerState': powerStateValue})
                          .then(
                              (_) => print('Power state updated successfully'))
                          .catchError((error) =>
                              print('Failed to update power state: $error'));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 60),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/Power.png')),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            blurRadius: 2.0,
                            offset: Offset(0.0, 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.only(right: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/Manual.png'),
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                          blurRadius: 2.0,
                          offset: Offset(0.0, 1.5),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showSlider = !_showSlider;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (_showSlider)
              const SizedBox(
                width: 400,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SliderWidget()],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: _sliderValue,
          onChanged: (double value) {
            setState(() {
              _sliderValue = value;
            });
          },
          min: 0.0,
          max: 100.0,
          divisions: 100,
          onChangeEnd: (double value) {
            FirebaseFirestore.instance
                .collection('EspData')
                .doc('Sent From Mobile')
                .update({'sliderValue': value.round()})
                .then((_) => print('Slider value updated successfully'))
                .catchError(
                    (error) => print('Failed to update slider value: $error'));
          },
        ),
      ],
    );
  }
}
