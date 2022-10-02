import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madee_kan/Widgets/custom_card_home.dart';
import 'package:madee_kan/cubit/auth_cubit.dart';
import 'package:madee_kan/cubit/kontrakan_cubit.dart';
import 'package:madee_kan/cubit/pembayaran_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<String> namaAnakKontrakan = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getJumlahOrang();
  }

  getData() async {
    final prefs = await _prefs;
    String token = prefs.getString('token')!;
    context.read<PembayaranCubit>().getPembayaran(token: token);
  }

  getJumlahOrang() async {
    final prefs = await _prefs;
    String token = prefs.getString('token')!;
    List<String> dataBaruDiGet = [];
    dataBaruDiGet =
        await context.read<KontrakanCubit>().getNamaAnakKontrakan(token: token);
    setState(() {
      namaAnakKontrakan = dataBaruDiGet;
    });
  }

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
                                'Jumlah Orang : ${namaAnakKontrakan.length}/${state.user.howManyRooms}',
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
      return BlocConsumer<PembayaranCubit, PembayaranState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is PembayaranFailed) {
            Fluttertoast.showToast(
                msg: state.error,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.sp);
          }
        },
        builder: (context, state) {
          if (state is PembayaranLoading) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PembayaranSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: 20.w,
                right: 20.h,
              ),
              child: Column(
                children:
                    state.pembayaran.map((e) => CustomCardHome()).toList(),
                // children: [
                //   CustomCardHome(),
                //   CustomCardHome(),
                //   CustomCardHome(),
                //   CustomCardHome(),
                //   CustomCardHome(),
                //   CustomCardHome(),
                // ],
              ),
            );
          }
          if (state is PembayaranSuccessDataKosong) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/datakosong.png'),
                  Text(
                    'Data Kosong',
                    style: TextStyle(
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        },
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: NavBar(),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () {
          // return Future.delayed(
          //   Duration(seconds: 1),
          //   () => print('refresh'),
          // );
          return getData();
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
