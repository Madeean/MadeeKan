import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_page.dart';

class EditAnakKontrakan extends StatefulWidget {
  const EditAnakKontrakan({Key? key}) : super(key: key);

  @override
  State<EditAnakKontrakan> createState() => _EditAnakKontrakanState();
}

class _EditAnakKontrakanState extends State<EditAnakKontrakan> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Anak Kontrakan',
          style: TextStyle(color: Colors.blue, fontSize: 22.sp),
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
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
                      maxLines: 1,
                      cursorColor: Colors.black,
                      obscureText: false,
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "ganti Name",
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
                        hintText: "ganti Umur",
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
                      'Alamat Asli',
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
                        hintText: "Ganti alamat asli",
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
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Ganti alamat ngontrak sekarang",
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
                      // controller: controller,
                      decoration: InputDecoration(
                        hintText: "Ganti harga perbulan",
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
                                print('camera');
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
                                print('gallery');
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
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 196.w,
                  height: 70.h,
                  margin: EdgeInsets.only(top: 20.sp, bottom: 10.sp),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Timer(Duration(seconds: 2), () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      });
                    },
                    child: Text(
                      'Edit Anak Kontrakan',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
