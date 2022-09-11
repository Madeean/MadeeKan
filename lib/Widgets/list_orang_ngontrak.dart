import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/Models/anak_kontrakan_model.dart';

import '../Home/detail_pengguna_page.dart';

class DaftarOrangNgontrak extends StatelessWidget {
  final AnakKontrakan anakKontrakan;
  const DaftarOrangNgontrak({Key? key, required this.anakKontrakan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPenggunaPage(
                      anakKontrakan: anakKontrakan,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 4.sp),
              height: 150.h,
              child: ClipRRect(
                child: Image.network(
                  '${anakKontrakan.foto_muka}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${anakKontrakan.name}',
                style: TextStyle(fontSize: 18.sp),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
