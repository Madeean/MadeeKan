import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/Widgets/custom_card_home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Madee',
                          style: TextStyle(
                            fontSize: 24.sp,
                          ),
                        ),
                        Text(
                          'Jumlah Orang : 15/30',
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
              ),
              Container(
                margin: EdgeInsets.only(top: 21.sp),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Cari anak kost",
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
