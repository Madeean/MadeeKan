import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madee_kan/Home/add_pembayaran.dart';
import 'package:madee_kan/Home/list_orang_ngontrak.dart';
import 'package:madee_kan/Home/setting_page.dart';
import 'package:madee_kan/Widgets/customNavigationItem.dart';
import 'package:madee_kan/cubit/page_cubit.dart';

import 'landing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget content(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return LandingPage();
      case 1:
        return AddPembayaran();
      case 2:
        return ListOrangNgontrak();
      case 3:
        return SettingPage();
      default:
        return LandingPage();
    }
  }

  Widget customNavigation(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      height: height * 0.1,
      padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomNavigationItem(
            imageUrl: 'assets/icon_home.png',
            index: 0,
          ),
          CustomNavigationItem(
            imageUrl: 'assets/plus.png',
            index: 1,
          ),
          CustomNavigationItem(
            imageUrl: 'assets/list.png',
            index: 2,
          ),
          CustomNavigationItem(
            imageUrl: 'assets/icon_settings.png',
            index: 3,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Widget customNavigation() {
    //   return Align(
    //     alignment: Alignment.bottomCenter,
    //     child: Container(
    //       margin: EdgeInsets.only(
    //           left: width * 0.06, right: width * 0.06, bottom: width * 0.06),
    //       width: double.infinity,
    //       height: 60,
    //       decoration: BoxDecoration(
    //         color: Colors.blue.shade100,
    //         borderRadius: BorderRadius.circular(18),
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           CustomNavigationItem(
    //             imageUrl: 'assets/icon_home.png',
    //             index: 0,
    //           ),
    //           CustomNavigationItem(
    //             imageUrl: 'assets/icon_booking.png',
    //             index: 1,
    //           ),
    //           CustomNavigationItem(
    //             imageUrl: 'assets/icon_card.png',
    //             index: 2,
    //           ),
    //           CustomNavigationItem(
    //             imageUrl: 'assets/icon_settings.png',
    //             index: 3,
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          bottomNavigationBar: customNavigation(context),
          body: Stack(
            children: [
              content(currentIndex),
            ],
          ),
        );
      },
    );
  }
}
