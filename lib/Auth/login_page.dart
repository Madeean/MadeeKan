import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madee_kan/Auth/register_page.dart';
import 'package:madee_kan/Home/home_page.dart';
import 'package:madee_kan/Widgets/loading_button.dart';
import 'package:madee_kan/cubit/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isloading = false;
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              color: Colors.grey.shade200.withOpacity(0.7.sp),
              borderRadius: BorderRadius.circular(
                17.sp,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20.sp),
                    child: Icon(
                      Icons.account_box_outlined,
                      size: 100.sp,
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email'),
                      TextFormField(
                        controller: emailController,
                        cursorColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Password'),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        cursorColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      } else if (state is AuthFailed) {
                        Fluttertoast.showToast(
                            msg: state.error,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0.sp);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return LoadingButton();
                      }
                      return Column(
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
                                BlocProvider.of<AuthCubit>(context).login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
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
                            margin: EdgeInsets.only(top: 20.sp),
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade300,
                              borderRadius: BorderRadius.circular(
                                18,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                print("width $width");
                                print("height ");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
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
                      );
                    },
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
