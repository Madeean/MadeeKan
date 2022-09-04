import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPenggunaPage extends StatefulWidget {
  const DetailPenggunaPage({Key? key}) : super(key: key);

  @override
  State<DetailPenggunaPage> createState() => _DetailPenggunaPageState();
}

class _DetailPenggunaPageState extends State<DetailPenggunaPage> {
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
                  'Umur: ',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                child: Text(
                  '20',
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
                  'Alamat KTP: ',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                child: Text(
                  'BSD',
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
                  'Bayaran Perbulan: ',
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
                  'Tanggal Bergabung: ',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
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
            TextSpan(
              text: "Yakin ingin Menghapus made?",
              children: [
                TextSpan(
                  style: TextStyle(fontWeight: FontWeight.normal),
                  text:
                      "\nPengguna yang sudah dihapus tidak dapat dikembalikan",
                ),
              ],
            ),
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
                print("Hapus");
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
    return Container(
      margin: EdgeInsets.only(
        left: 20.sp,
        right: 20.sp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 140.w,
            height: 50.h,
            margin: EdgeInsets.only(top: 30.sp, bottom: 30.sp),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                print("edit pengguna");
              },
              child: Text(
                'Edit Pengguna',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: 160.w,
            height: 50.h,
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
                'Hapus Pengguna',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Pengguna',
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
