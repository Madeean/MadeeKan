import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madee_kan/Home/tambah_orang_ngontrak.dart';
import 'package:madee_kan/Models/anak_kontrakan_model.dart';
import 'package:madee_kan/Widgets/list_orang_ngontrak.dart';
import 'package:madee_kan/cubit/kontrakan_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navbar.dart';

class ListOrangNgontrak extends StatefulWidget {
  const ListOrangNgontrak({Key? key}) : super(key: key);

  @override
  State<ListOrangNgontrak> createState() => _ListOrangNgontrakState();
}

class _ListOrangNgontrakState extends State<ListOrangNgontrak> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    final prefs = await _prefs;
    String token = prefs.getString('token')!;
    context.read<KontrakanCubit>().getAnakKontrakan(token: token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Orang Ngontrak',
          style: TextStyle(color: Colors.blue, fontSize: 22.sp),
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
        foregroundColor: Colors.blue,
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
          return getData();
        },
        child: BlocConsumer<KontrakanCubit, KontrakanState>(
          listener: (context, state) {
            if (state is KontrakanLoading) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is KontrakanFailed) {
              Fluttertoast.showToast(
                  msg: state.error,
                  backgroundColor: Colors.red,
                  textColor: Colors.white);
            }
          },
          builder: (context, state) {
            if (state is getAnakKontrakanSuccess) {
              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 3.sp,
                mainAxisSpacing: 2.sp,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(bottom: 20.sp),
                children: state.anakKontrakan
                    .map((AnakKontrakan anakKontrakan) => DaftarOrangNgontrak(
                          anakKontrakan: anakKontrakan,
                        ))
                    .toList(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
