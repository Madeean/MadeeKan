import 'dart:async';

import 'package:flutter/material.dart';
import 'package:madee_kan/Home/home_page.dart';
import 'package:madee_kan/Widgets/loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurple,
              Colors.teal,
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.7),
              borderRadius: BorderRadius.circular(
                17,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: width * 0.02),
                    child: Icon(
                      Icons.account_box_outlined,
                      size: 100,
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email'),
                      TextFormField(
                        cursorColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Password'),
                      TextFormField(
                        obscureText: true,
                        cursorColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: isloading
                      ? LoadingButton()
                      : Container(
                          width: width * .5,
                          height: width * .17,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isloading = true;
                              });
                              Timer(Duration(seconds: 2), () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                    (route) => false);
                              });
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
