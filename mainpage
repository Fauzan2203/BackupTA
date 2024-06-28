import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  bool _showSlider = false;
  bool _isPowerOn = false;
  bool _isAutoMode = false;
  int number = 0;
  double _sliderValue = 1.0;

  @override
  void initState() {
    super.initState();
    _fetchPMValue();
  }

  void _fetchPMValue() {
    FirebaseFirestore.instance
        .collection('EspData')
        .doc('DHT11')
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        if (data != null) {
          setState(() {
            number = int.tryParse(data['PM25'] as String? ?? '') ?? 0;
          });
        }
      } else {
        print('Document does not exist');
      }
    }, onError: (error) {
      print("Failed to fetch PM value: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (!_isPowerOn) {
        return const Color.fromRGBO(160, 199, 235, 1);
      }
      if (number > 250) {
        return Colors.red.shade900;
      } else if (number > 150) {
        return Colors.purple;
      } else if (number > 55) {
        return Colors.red;
      } else if (number > 35) {
        return Colors.orange;
      } else if (number > 12) {
        return Colors.yellow;
      } else if (number > 0) {
        return Colors.green;
      } else {
        return Colors.grey;
      }
    }

    return Scaffold(
        backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromRGBO(255, 255, 255, 255),
          centerTitle: true,
          automaticallyImplyLeading: false,
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
                decoration: BoxDecoration(
                  color: getColor(),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      blurRadius: 2.0,
                      offset: Offset(0.0, 1.5),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Indeks Kualitas Udara'),
                          content: Image.asset('assets/AQI Index.png'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Tutup'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 64),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '$number',
                          style: TextStyle(
                            color: getColor(),
                            fontWeight: FontWeight.bold,
                            fontSize: 100,
                            height: 0.95,
                            shadows: const [
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
                            color: getColor(),
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
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
                                Map<String, dynamic>? data = snapshot.data!
                                    .data() as Map<String, dynamic>?;

                                if (data != null) {
                                  // Access the specific fields
                                  String tempValue =
                                      data['Temperature'] ?? '0.0';
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
                                Map<String, dynamic>? data = snapshot.data!
                                    .data() as Map<String, dynamic>?;

                                if (data != null) {
                                  // Access the specific fields
                                  String coValue = data['CO'] ?? '0.0';
                                  double CO = double.tryParse(coValue) ?? 0;

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 3),
                                    child: Text(
                                      '${CO.toStringAsFixed(1)}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        shadows: [
                                          Shadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
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
                                Map<String, dynamic>? data = snapshot.data!
                                    .data() as Map<String, dynamic>?;

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
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!_isPowerOn) {
                              return; // Do nothing if power is off
                            }
                            setState(() {
                              _isAutoMode = !_isAutoMode;
                              _showSlider =
                                  !_isAutoMode; // Toggle slider visibility
                            });

                            FirebaseFirestore.instance
                                .collection('EspData')
                                .doc('Sent From Mobile')
                                .update({'autoMode': _isAutoMode})
                                .then((_) => print('Mode updated successfully'))
                                .catchError((error) =>
                                    print('Failed to update mode: $error'));
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            transform: _isAutoMode
                                ? Matrix4.translationValues(0, 3, 0)
                                : Matrix4.translationValues(0, 0, 0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _isAutoMode
                                    ? Color.fromRGBO(178, 209, 238, 1)
                                    : Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(2, 2),
                                      blurRadius: 5),
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-1, -1),
                                      blurRadius: 5),
                                ],
                              ),
                              child: Center(
                                child: _isAutoMode
                                    ? const Text(
                                        'A',
                                        style: TextStyle(
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                        ),
                                      )
                                    : const Icon(
                                        Icons.touch_app_sharp,
                                        size: 60,
                                        color: Color.fromRGBO(178, 209, 238, 1),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Mode',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              _isPowerOn = !_isPowerOn;
                            });

                            // Update the power state in Firestore
                            FirebaseFirestore.instance
                                .collection('EspData')
                                .doc('Sent From Mobile')
                                .update({'powerState': _isPowerOn})
                                .then((_) =>
                                    print('Power state updated successfully'))
                                .catchError((error) => print(
                                    'Failed to update power state: $error'));

                            // If power is turned on, fetch AutoMode value from Firestore
                            if (_isPowerOn) {
                              try {
                                DocumentSnapshot document =
                                    await FirebaseFirestore.instance
                                        .collection('EspData')
                                        .doc('Sent From Mobile')
                                        .get();

                                var data = document
                                    .data(); // Get the data from the document
                                if (data != null) {
                                  // Check if the data is not null
                                  Map<String, dynamic> dataMap = data as Map<
                                      String,
                                      dynamic>; // Cast to Map<String, dynamic>
                                  bool autoMode = dataMap['autoMode'] ??
                                      false; // Safely access 'autoMode' with null-aware operator

                                  setState(() {
                                    _isAutoMode = autoMode;
                                    _showSlider =
                                        !autoMode; // If autoMode is true, showSlider should be false, and vice versa
                                  });
                                } else {
                                  print(
                                      'No data found in the document'); // Handle the case where data is null
                                }
                              } catch (error) {
                                print(
                                    'Failed to fetch AutoMode value: $error'); // Handle any errors that occur during the fetch
                              }
                            }
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            transform: _isPowerOn
                                ? Matrix4.translationValues(0, 3, 0)
                                : Matrix4.translationValues(0, 0, 0),
                            child: Container(
                              width: 100,
                              height: 100,
                              //margin: const EdgeInsets.only(top: 60),
                              decoration: BoxDecoration(
                                color: _isPowerOn
                                    ? Color.fromRGBO(178, 209, 238, 1)
                                    : Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(2, 2),
                                      blurRadius: 5),
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-1, -1),
                                      blurRadius: 5),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.power_settings_new_sharp,
                                  size: 80,
                                  color: _isPowerOn
                                      ? Colors.white
                                      : Color.fromRGBO(178, 209, 238, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Power',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (_showSlider)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_isPowerOn)
                        SliderWidget(
                          initialSliderValue: _sliderValue,
                          onSliderValueChanged: (double value) {
                            setState(() {
                              _sliderValue = value;
                            });

                            FirebaseFirestore.instance
                                .collection('EspData')
                                .doc('Sent From Mobile')
                                .update({'sliderValue': value.round()})
                                .then((_) =>
                                    print('Slider value updated successfully'))
                                .catchError((error) => print(
                                    'Failed to update slider value: $error'));
                          },
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ));
  }
}

class SliderWidget extends StatefulWidget {
  final double initialSliderValue;
  final ValueChanged<double> onSliderValueChanged;

  const SliderWidget({
    Key? key,
    required this.initialSliderValue,
    required this.onSliderValueChanged,
  }) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.initialSliderValue;
  }

  @override
  void didUpdateWidget(covariant SliderWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialSliderValue != oldWidget.initialSliderValue) {
      _sliderValue = widget.initialSliderValue;
    }
  }

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
            widget.onSliderValueChanged(value);
          },
          min: 1.0,
          max: 4.0,
          divisions: 3,
          label: _sliderValue.toString(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Low',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'High',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
