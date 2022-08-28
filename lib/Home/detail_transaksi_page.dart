import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailTransaksi extends StatefulWidget {
  const DetailTransaksi({Key? key}) : super(key: key);

  @override
  State<DetailTransaksi> createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  String isLunas = "BELUM LUNAS";

  Widget GambarBukti() {
    return Container(
      width: double.infinity,
      child: Center(
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/PickImage.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Data() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nama pengontrak: ',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              Text(
                'Made Reihan',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Alamat/nomor kontrakan: ',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Kampung dadap no5',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status Bulan ini : ',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              Text(
                'BELUM LUNAS',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: isLunas == "LUNAS" ? Colors.blue : Colors.red,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Jumlah yang harus dibayar bulan ini: ',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Text(
                '100.000',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Jumlah yang dibayar bulan ini: ',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Text(
                '100.000',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal Bayar: ',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              Text(
                '26-12-2019',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Yakin(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text.rich(
            TextSpan(text: "Yakin ingin melunaskan  bulan ini?", children: [
              TextSpan(
                style: TextStyle(fontWeight: FontWeight.normal),
                text:
                    "\nPastikan uang yang dibayarkan sudah lunas untuk bulan ini, jika tidak yakin bisa tekan tombol batal.",
              ),
            ]),
          ),
          children: [
            SimpleDialogOption(
              child: Text(
                'YA',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                print("melunaskan");
              },
            ),
            SimpleDialogOption(
              child: Text(
                'BATAL',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget BtnLunas() {
    return isLunas == "LUNAS"
        ? SizedBox()
        : Container(
            width: 150.w,
            height: 70.h,
            margin: EdgeInsets.only(top: 30.h, bottom: 30.h),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Yakin(context);
              },
              child: Text(
                'LUNAS ?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Transaksi',
          style: TextStyle(color: Colors.blue, fontSize: 22.sp),
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      body: ListView(children: [
        Column(
          children: [
            GambarBukti(),
            Data(),
            BtnLunas(),
          ],
        )
      ]),
    );
  }
}
