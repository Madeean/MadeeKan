import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/Widgets/custom_card_home.dart';
import 'package:madee_kan/cubit/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    DateTime today = DateTime.now();
    String dateStr = "${today.day}-${today.month}-${today.year}";

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Widget top() {
      return SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.h,
          ),
          child: Column(
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => _scaffoldKey.currentState?.openDrawer(),
                          child: Icon(
                            Icons.menu,
                            color: Colors.blue,
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(
                          width: 20.sp,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${state.user.name}',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                ),
                              ),
                              Text(
                                'Jumlah Orang : 0/${state.user.howManyRooms}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dateStr,
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 21.sp),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Cari orang kontrakan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        margin: EdgeInsets.only(
          left: 20.w,
          right: 20.h,
        ),
        child: Column(
          children: [
            CustomCardHome(),
            CustomCardHome(),
            CustomCardHome(),
            CustomCardHome(),
            CustomCardHome(),
            CustomCardHome(),
          ],
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: NavBar(),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
            () => print('refresh'),
          );
        },
        child: ListView(
          children: [
            Column(
              children: [
                top(),
                body(),
                SizedBox(
                  height: height * 0.05,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
