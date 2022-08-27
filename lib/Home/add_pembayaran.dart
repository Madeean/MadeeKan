import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPembayaran extends StatefulWidget {
  const AddPembayaran({Key? key}) : super(key: key);

  @override
  State<AddPembayaran> createState() => _AddPembayaranState();
}

class _AddPembayaranState extends State<AddPembayaran> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

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

  File? selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    var image;
    final ImagePicker pick = ImagePicker();
    if (type == "camera") {
      image = await pick.getImage(
        source: ImageSource.camera,
      );
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
        top: width * 0.02,
        left: width * 0.06,
        right: width * 0.06,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilih Nama",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Container(
            width: double.infinity,
            height: height * 0.07,
            margin: EdgeInsets.only(top: width * 0.02),
            padding: EdgeInsets.only(
              left: width * 0.06,
              right: width * 0.06,
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
        top: width * 0.07,
        left: width * 0.06,
        right: width * 0.06,
      ),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Tanggal Bayar',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: width * 0.03,
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
            height: width * 0.03,
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
        top: width * 0.07,
        left: width * 0.06,
        right: width * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bukti Bayar',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: width * 0.03,
            ),
            width: double.infinity,
            height: height * 0.3,
            child: ClipRRect(
                child: selectedImage != null
                    ? Image.file(selectedImage!)
                    : Image.asset('assets/PickImage.png')),
          ),
          Container(
            margin: EdgeInsets.only(
              top: width * 0.07,
              left: width * 0.06,
              right: width * 0.06,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width * 0.3,
                  height: height * 0.07,
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
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: width * 0.3,
                  height: height * 0.07,
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
                      style: TextStyle(
                        color: Colors.blue,
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

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran Bulan ${today.month}',
          style: TextStyle(
            color: Colors.blue,
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
            ],
          )
        ],
      ),
    );
  }
}
