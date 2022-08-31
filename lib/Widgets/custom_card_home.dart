import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/Home/detail_pengguna_page.dart';
import 'package:madee_kan/Home/detail_transaksi_page.dart';

class CustomCardHome extends StatefulWidget {
  const CustomCardHome({Key? key}) : super(key: key);

  @override
  State<CustomCardHome> createState() => _CustomCardHomeState();
}

class _CustomCardHomeState extends State<CustomCardHome> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.7),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(
              -1,
              2,
            ),
          )
        ],
      ),
      padding: EdgeInsets.all(15.sp),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Made Reihans',
                      style: TextStyle(
                        fontSize: 24.sp,
                      ),
                    ),
                    Text(
                      'Kampung dadap no5',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'LUNAS',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 22.sp),
            child: Center(
              child: Text(
                'Rp. 100.000',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 140.w,
                  height: 67.h,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailTransaksi()));
                    },
                    child: Text(
                      'Detail Transaksi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 67.h,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPenggunaPage()));
                    },
                    child: Text(
                      'Detail Pengguna',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
