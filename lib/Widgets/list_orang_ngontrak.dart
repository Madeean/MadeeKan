import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaftarOrangNgontrak extends StatelessWidget {
  const DaftarOrangNgontrak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tap');
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
                child: Image.asset(
                  'assets/image_destination1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Made Reihan Diva Suarna',
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
