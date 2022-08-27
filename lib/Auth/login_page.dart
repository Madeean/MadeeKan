import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/Auth/register_page.dart';
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
            width: 370.w,
            height: 520.h,
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
                    margin: EdgeInsets.only(top: 20.h),
                    child: Icon(
                      Icons.account_box_outlined,
                      size: 100,
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.w),
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
                  margin: EdgeInsets.all(20.w),
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
                      : Column(
                          children: [
                            Container(
                              width: 196.w,
                              height: 70.h,
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
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                              width: 196.w,
                              height: 70.h,
                              margin: EdgeInsets.only(top: 20.h),
                              decoration: BoxDecoration(
                                color: Colors.yellow.shade300,
                                borderRadius: BorderRadius.circular(
                                  18,
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  print("width $width");
                                  print("height $height");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPage()));
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
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
