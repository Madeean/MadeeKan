import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Home/detail_pengguna_page.dart';
import '../Home/detail_transaksi_page.dart';

class CustomCardBelumLunas extends StatelessWidget {
  final String nama;
  final String alamat;
  final String tanggal;
  final String isLunas;
  final String jumlahBayar;
  final String baruBayar;
  const CustomCardBelumLunas({
    Key? key,
    required this.nama,
    required this.alamat,
    required this.baruBayar,
    required this.isLunas,
    required this.jumlahBayar,
    required this.tanggal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.sp, left: 10.sp, right: 10.sp),
      width: double.infinity,
      height: 350.h,
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
                      '$nama',
                      style: TextStyle(
                        fontSize: 24.sp,
                      ),
                    ),
                    Text(
                      '$alamat',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      '$tanggal',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$isLunas',
                style: TextStyle(
                  color: isLunas == "LUNAS" ? Colors.blue : Colors.red,
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
                '$baruBayar / $jumlahBayar',
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
                    child: Expanded(
                      child: Text(
                        'Detail Transaksi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
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
                    child: Expanded(
                      child: Text(
                        'Detail Pengguna',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
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
