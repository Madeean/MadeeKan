import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/Widgets/loading_button.dart';

import '../Home/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    TextFormField(
                      maxLines: 1,
                      cursorColor: Colors.black,
                      obscureText: false,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Your Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      obscureText: false,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Your Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your kontrakan Name',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      obscureText: false,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Your Kontrakan name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How Many rooms you have?',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      obscureText: false,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Your Rooms",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      obscureText: true,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Your Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: isLoading
                    ? LoadingButton(
                        margin: EdgeInsets.only(top: 10.sp),
                      )
                    : Container(
                        width: 196.w,
                        height: 70.h,
                        margin: EdgeInsets.only(top: 20.sp, bottom: 10.sp),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isLoading = true;
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
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
