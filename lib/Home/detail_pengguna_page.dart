import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madee_kan/Home/edit_anak_kontrakan.dart';
import 'package:madee_kan/Home/home_page.dart';
import 'package:madee_kan/Models/anak_kontrakan_model.dart';
import 'package:madee_kan/cubit/kontrakan_cubit.dart';
import 'package:madee_kan/cubit/page_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPenggunaPage extends StatefulWidget {
  final AnakKontrakan anakKontrakan;
  const DetailPenggunaPage({Key? key, required this.anakKontrakan})
      : super(key: key);

  @override
  State<DetailPenggunaPage> createState() => _DetailPenggunaPageState();
}

class _DetailPenggunaPageState extends State<DetailPenggunaPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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
                image: NetworkImage('${widget.anakKontrakan.foto_muka}'),
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
                  '${widget.anakKontrakan.name}',
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
                  '${widget.anakKontrakan.umur}',
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
                  '${widget.anakKontrakan.alamat_asli}',
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
                  '${widget.anakKontrakan.alamat_kontrakan}',
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
                'Rp. ${widget.anakKontrakan.harga_perbulan}',
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
                '${widget.anakKontrakan.created}',
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
            BlocConsumer<KontrakanCubit, KontrakanState>(
              listener: (context, state) {
                if (state is KontrakanFailed) {
                  Fluttertoast.showToast(
                      msg: state.error,
                      backgroundColor: Colors.red,
                      textColor: Colors.white);
                }
                if (state is hapusAnakKontrakanSuccess) {
                  context.read<PageCubit>().setPage(0);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              builder: (context, state) {
                if (state is KontrakanLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SimpleDialogOption(
                  child: Text(
                    'HAPUS',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    final prefs = await _prefs;
                    String token = prefs.getString('token')!;
                    context.read<KontrakanCubit>().hapusAnakKontrakan(
                          id: widget.anakKontrakan.id,
                          token: token,
                        );
                  },
                );
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditAnakKontrakan()));
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
