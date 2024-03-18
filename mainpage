import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<mainpage> {
  bool _showSlider = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 255),
        centerTitle: true,
        title: const Text(
          "Home", style: TextStyle(fontFamily: "Raleway"), //ganti logo
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
                      offset: Offset(0.0, 1.5)),
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
                            )
                          ]),
                    ),
                    Text(
                      'PM2.5',
                      style: TextStyle(
                          color: Color.fromRGBO(160, 199, 235, 1),
                          fontSize: 24),
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
                    blurRadius: 2.0,
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
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(160, 190, 235, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '12°C',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            shadows: [
                              Shadow(
                                  color: Colors.black12,
                                  offset: Offset(-2, -2),
                                  blurRadius: 5),
                            ],
                          ),
                        ),
                        Text(
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
                              return CircularProgressIndicator();
                            }
                            if (snapshot.hasData && snapshot.data!.exists) {
                              // Access the data from the document
                              Map<String, dynamic>? data = snapshot.data!.data()
                                  as Map<String, dynamic>?;

                              if (data != null) {
                                // Access the specific fields
                                String coValue = data['CO'] ?? '0.0';

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    coValue,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 2,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                // Handle the case when data is null
                                return Text('Data is null');
                              }
                            } else {
                              // Handle the case when the document doesn't exist
                              return Text('Document does not exist');
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
                                color: Colors.black,
                                blurRadius: 2,
                                offset: Offset(0, 2),
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
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(160, 199, 235, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '29%',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            shadows: [
                              Shadow(
                                  color: Colors.black12,
                                  offset: Offset(-2, -2),
                                  blurRadius: 5),
                            ],
                          ),
                        ),
                        Text(
                          'Lembab',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  )
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
                            offset: Offset(0.0, 1.5)),
                      ],
                    ),
                  ),
                  Container(
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
                            offset: Offset(0.0, 1.5)),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.only(right: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('assets/Manual.png')),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            blurRadius: 2.0,
                            offset: Offset(0.0, 1.5)),
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
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SliderWidget()],
                ),
              ),
            SizedBox(
              width: 400,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                              blurRadius: 2.0,
                              offset: Offset(0.0, 1.5)),
                        ],
                      ),
                      child: Image.asset('assets/Stat.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                              blurRadius: 2.0,
                              offset: Offset(0.0, 1.5)),
                        ],
                      ),
                      child: Image.asset('assets/Fan.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

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
        ),
      ],
    );
  }
}
