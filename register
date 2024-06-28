import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/(bg)Register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              alignment: const Alignment(-0.7, -0.4),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(
                  fontFamily: "Railway",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 33,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        hintText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sign Up',
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
                              onPressed: _signUp,
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
                          'Already have account?',
                          style: TextStyle(
                              fontFamily: "Railway",
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                fontFamily: "Railway",
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                color: Color(0xff4c505b)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is succesfully created");
      Navigator.pushNamed(context, "/bottomnav");
    } else {
      print("Some error happend");
    }
  }
}
