import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingButton extends StatefulWidget {
  final double width;
  final double height;
  final EdgeInsets margin;

  const LoadingButton(
      {Key? key,
      this.width = 0,
      this.height = 0,
      this.margin = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: 196.w,
      height: 70.h,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(
          18,
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
