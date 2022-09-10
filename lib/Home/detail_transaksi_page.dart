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
      margin: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 25.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Nama pengontrak: ',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                child: Text(
                  'Made Reihan',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.sp,
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
              Spacer(),
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
            thickness: 1.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Status Bulan ini : ',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                child: Text(
                  'BELUM LUNAS',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: isLunas == "LUNAS" ? Colors.blue : Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.sp,
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
              Spacer(),
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
            thickness: 1.sp,
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
              Spacer(),
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
            thickness: 1.sp,
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
              Spacer(),
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
            thickness: 1.sp,
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
            TextSpan(text: "Yakin ingin menghapus  bulan ini?", children: [
              TextSpan(
                style: TextStyle(fontWeight: FontWeight.normal),
                text: "\nKomponen yang sudah dihapus tidak bisa dikembalikan",
              ),
            ]),
          ),
          children: [
            SimpleDialogOption(
              child: Text(
                'HAPUS',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                print("hapus");
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
            margin: EdgeInsets.only(top: 30.sp, bottom: 30.sp),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Yakin(context);
              },
              child: Text(
                'Hapus Transaksi ?',
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
