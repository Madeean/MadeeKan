import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class TambahOrangNgontrak extends StatefulWidget {
  const TambahOrangNgontrak({Key? key}) : super(key: key);

  @override
  State<TambahOrangNgontrak> createState() => _TambahOrangNgontrakState();
}

class _TambahOrangNgontrakState extends State<TambahOrangNgontrak> {
  @override
  File? selectedImage;
  String base64Image = "";

  Future<bool> checkAndRequestCameraPermissions() async {
    var status = await Permission.camera.status;
    print(status);
    if (status.isGranted) {
      return false;
    } else {
      return true;
    }
  }

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tambah Orang',
          style: TextStyle(color: Colors.blue, fontSize: 22.sp),
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Simpan',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      obscureText: false,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Nama Orang ngontrak",
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
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Umur',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      obscureText: false,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Umur Orang ngontrak",
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
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alamat',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      obscureText: false,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Alamat asli sesuai ktp",
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
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alamat ngontrak sekarang',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      obscureText: false,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Alamat kontrakan dia sekarang",
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
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harga perbulan',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      obscureText: false,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "harga perbulan",
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
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 24.sp,
                  left: 20.sp,
                  right: 20.sp,
                  bottom: 50.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Foto muka',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 12.sp,
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
                        top: 20.sp,
                        left: 20.sp,
                        right: 20.sp,
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
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
                                width: 2.sp,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: () {
                                chooseImage("gallery");
                              },
                              child: Text(
                                "Gallery",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
