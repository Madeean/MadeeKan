import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madee_kan/Widgets/loading_button.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_page.dart';

class AddPembayaran extends StatefulWidget {
  const AddPembayaran({Key? key}) : super(key: key);

  @override
  State<AddPembayaran> createState() => _AddPembayaranState();
}

class _AddPembayaranState extends State<AddPembayaran> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  bool isLoading = false;

  String? _currentName;

  final nameList = [
    'Kamar 1',
    'Kamar 2',
    'Kamar 3',
    'Kamar 4',
    'Kamar 5',
  ];

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Column(
          children: <Widget>[
            Container(
              height: 450,
              width: 700,
              child: child,
            ),
          ],
        );
      },
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  Future<bool> checkAndRequestCameraPermissions() async {
    var status = await Permission.camera.status;
    print(status);
    if (status.isGranted) {
      return false;
    } else {
      return true;
    }
  }

  File? selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    var image;
    final ImagePicker pick = ImagePicker();
    if (type == "camera") {
      if (await checkAndRequestCameraPermissions()) {
        image = await pick.getImage(
          source: ImageSource.camera,
        );
      } else {
        Fluttertoast.showToast(
            msg: "Permission Denied",
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } else {
      image = await pick.getImage(
        source: ImageSource.gallery,
      );
    }

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
      });
    }

    print(selectedImage);
  }

  Widget PilihNama(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        top: 24.h,
        left: 20.w,
        right: 20.w,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilih Nama Nasabah",
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
          Container(
            width: double.infinity,
            height: 53.h,
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 1),
            ),
            child: DropdownButtonFormField<String>(
              value: _currentName,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
              ),
              style: TextStyle(color: Colors.black),
              dropdownColor: Colors.white,
              items: nameList.map((facility) {
                return DropdownMenuItem(
                  value: facility,
                  child: Text('$facility'),
                );
              }).toList(),
              onChanged: (val) => setState(() {
                _currentName = val;
                print(_currentName);
              }),
              hint: Text(
                'Pilih Nama',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pilihTanggalBayar(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        top: 24.h,
        left: 20.w,
        right: 20.w,
      ),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Tanggal Bayar',
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text("Choose Date"),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
          )
        ],
      ),
    );
  }

  Widget buktiBayar(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        top: 24.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bukti Bayar',
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 12.h,
            ),
            width: double.infinity,
            height: 250.h,
            child: ClipRRect(
                child: selectedImage != null
                    ? Image.file(selectedImage!)
                    : Image.asset('assets/PickImage.png')),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 130.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      chooseImage("camera");
                    },
                    child: Text(
                      "Camera",
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
                Container(
                  width: 130.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      chooseImage("gallery");
                    },
                    child: Text(
                      "Gallery",
                      style: TextStyle(color: Colors.blue, fontSize: 14.sp),
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

  Widget jumlahBayar(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        top: 32.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jumlah Bayar',
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            cursorColor: Colors.black,
            // controller: controller,
            decoration: InputDecoration(
              hintText: "Banyaknya uang yang dibayar",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  18,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget btnStore() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: isLoading
          ? LoadingButton(
              margin: EdgeInsets.only(top: 35.h),
            )
          : Container(
              width: width * .5,
              height: height * .09,
              margin: EdgeInsets.only(top: 35.h),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(
                  18,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  print('s');
                  setState(() {
                    isLoading = true;
                  });
                  Timer(Duration(seconds: 2), () {
                    setState(() {
                      isLoading = false;
                    });
                  });
                },
                child: Text(
                  'Simpan Data',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    DateTime today = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran Bulan ${today.month}',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PilihNama(context),
              pilihTanggalBayar(context),
              buktiBayar(context),
              jumlahBayar(context),
              btnStore(),
              SizedBox(
                height: 40.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
