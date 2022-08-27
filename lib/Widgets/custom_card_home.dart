import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      margin: EdgeInsets.only(top: 20.h),
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
      padding: EdgeInsets.all(15.w),
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
            margin: EdgeInsets.only(top: 22.h),
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
            padding: EdgeInsets.only(top: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 140.w,
                  height: 87.h,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Detail Transaksi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 87.h,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Detail Pengguna',
                      style: TextStyle(
                        fontSize: 14.sp,
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
