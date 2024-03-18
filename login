import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/(bg)Login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            alignment: const Alignment(-0.7, -0.4),
            child: const Text(
              'Welcome!',
              style: TextStyle(
                fontFamily: "Railway",
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 33,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: const Alignment(-0.6, -0.1),
            child: const Text(
              "Please Sign In to Continue",
              style: TextStyle(
                  fontFamily: "Railway",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15),
            ),
          ),
          SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5,
                      right: 35,
                      left: 35),
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromRGBO(160, 199, 235, 1),
                        filled: true,
                        label: const Text("Email"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color.fromRGBO(160, 199, 235, 1),
                        filled: true,
                        label: const Text("Password"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.end, // Mengatur teks ke kanan
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontFamily: "Railway",
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                color: Color(0xff4c505b)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sign In',
                            style: TextStyle(
                                fontFamily: "Railway",
                                color: Color(0xff4c505b),
                                fontSize: 27,
                                fontWeight: FontWeight.w700),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xff4c505b),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, '/mainpage');
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Dont have an account yet?',
                            style: TextStyle(
                                fontFamily: "Railway",
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontFamily: "Railway",
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                  color: Color(0xff4c505b)),
                            ),
                          )
                        ])
                  ])))
        ]),
      ),
    );
  }
}
