import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/Home/tambah_orang_ngontrak.dart';
import 'package:madee_kan/Widgets/list_orang_ngontrak.dart';

class ListOrangNgontrak extends StatefulWidget {
  const ListOrangNgontrak({Key? key}) : super(key: key);

  @override
  State<ListOrangNgontrak> createState() => _ListOrangNgontrakState();
}

class _ListOrangNgontrakState extends State<ListOrangNgontrak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Orang Ngontrak',
          style: TextStyle(color: Colors.blue, fontSize: 22.sp),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TambahOrangNgontrak(),
                ),
              );
            },
            child: Text(
              'Tambah Data',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () => print('refresh'));
        },
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 3.sp,
          mainAxisSpacing: 2.sp,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(bottom: 20.sp),
          children: [
            DaftarOrangNgontrak(),
            DaftarOrangNgontrak(),
            DaftarOrangNgontrak(),
            DaftarOrangNgontrak(),
            DaftarOrangNgontrak(),
            DaftarOrangNgontrak(),
          ],
        ),
      ),
    );
  }
}
