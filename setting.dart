import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(178, 209, 238, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 255),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Setting",
          style: TextStyle(fontFamily: "Raleway"),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, "/");
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
          child: Text(
            'Log Out',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
