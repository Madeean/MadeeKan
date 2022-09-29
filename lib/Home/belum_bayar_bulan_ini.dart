import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'navbar.dart';

class BelumBayarBulanIni extends StatefulWidget {
  const BelumBayarBulanIni({Key? key}) : super(key: key);

  @override
  State<BelumBayarBulanIni> createState() => _BelumBayarBulanIniState();
}

class _BelumBayarBulanIniState extends State<BelumBayarBulanIni> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool open = false;
  void bukaNavbar() {
    setState(() {
      open = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Belum Bayar Bulanan',
          style: TextStyle(
            fontSize: 23.sp,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text('Made Reihan'),
                  subtitle: Text('Bulan ke - 9'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
