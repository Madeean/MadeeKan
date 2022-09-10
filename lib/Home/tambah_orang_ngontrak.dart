import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madee_kan/Home/home_page.dart';
import 'package:madee_kan/Home/list_orang_ngontrak.dart';
import 'package:madee_kan/Widgets/list_orang_ngontrak.dart';
import 'package:madee_kan/Widgets/loading_button.dart';
import 'package:madee_kan/cubit/kontrakan_cubit.dart';
import 'package:madee_kan/cubit/page_cubit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TambahOrangNgontrak extends StatefulWidget {
  const TambahOrangNgontrak({Key? key}) : super(key: key);

  @override
  State<TambahOrangNgontrak> createState() => _TambahOrangNgontrakState();
}

class _TambahOrangNgontrakState extends State<TambahOrangNgontrak> {
  TextEditingController namaOrangNgontrakController =
      TextEditingController(text: '');
  TextEditingController umurOrangNgontrakController =
      TextEditingController(text: '');
  TextEditingController alamatAsliOrangNgontrakController =
      TextEditingController(text: '');
  TextEditingController alamatNgontrakSekarangController =
      TextEditingController(text: '');
  TextEditingController hargaPerbulanController =
      TextEditingController(text: '');

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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
        try {
          image = await pick.getImage(
            source: ImageSource.camera,
          );
        } catch (e) {
          Fluttertoast.showToast(
              msg: "permission denied",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
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
                      controller: namaOrangNgontrakController,
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
                      controller: umurOrangNgontrakController,
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
                      controller: alamatAsliOrangNgontrakController,
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
                      controller: alamatNgontrakSekarangController,
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
                      controller: hargaPerbulanController,
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
                    ),
                    Center(
                      child: BlocConsumer<KontrakanCubit, KontrakanState>(
                        listener: (context, state) {
                          // TODO: implement listener
                          if (state is KontrakanFailed) {
                            Fluttertoast.showToast(
                                msg: state.error,
                                backgroundColor: Colors.red,
                                textColor: Colors.white);
                          }
                          if (state is addAnakKontrakanSuccess) {
                            context.read<PageCubit>().setPage(2);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        },
                        builder: (context, state) {
                          if (state is KontrakanLoading) {
                            return LoadingButton(
                              margin: EdgeInsets.only(
                                top: 30.sp,
                              ),
                            );
                          }
                          return Container(
                            width: 196.w,
                            height: 70.h,
                            margin: EdgeInsets.only(top: 40.sp, bottom: 10.sp),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(
                                18,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                final prefs = await _prefs;
                                if (namaOrangNgontrakController.text.isEmpty ||
                                    alamatNgontrakSekarangController
                                        .text.isEmpty ||
                                    hargaPerbulanController.text.isEmpty ||
                                    selectedImage == null) {
                                  Fluttertoast.showToast(
                                      msg: "Data tidak boleh kosong",
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                } else {
                                  String token = prefs.getString('token')!;
                                  int harga =
                                      int.parse(hargaPerbulanController.text);
                                  int umur = int.parse(
                                      umurOrangNgontrakController.text);
                                  context.read<KontrakanCubit>().addKontrakan(
                                        alamat_asli:
                                            alamatAsliOrangNgontrakController
                                                .text,
                                        alamat_kontrakan:
                                            alamatNgontrakSekarangController
                                                .text,
                                        harga_perbulan: harga,
                                        name: namaOrangNgontrakController.text,
                                        foto_muka: selectedImage!.path,
                                        token: token,
                                        umur: umur,
                                      );
                                }
                              },
                              child: Text(
                                'Tambah',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
