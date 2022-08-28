import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Auth/login_page.dart';

class CustomSettingCard extends StatelessWidget {
  final String title;
  final Function() onTap;
  const CustomSettingCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 70.h,
          child: Container(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$title',
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
