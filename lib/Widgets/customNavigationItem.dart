import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/cubit/page_cubit.dart';
import 'package:provider/provider.dart';

class CustomNavigationItem extends StatelessWidget {
  final String imageUrl;
  final int index;
  const CustomNavigationItem({
    Key? key,
    required this.imageUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        children: [
          SizedBox(),
          Container(
            width: 40.w,
            // decoration: BoxDecoration(
            //   color: Colors.red,
            // ),
            margin: EdgeInsets.only(
              top: 20.sp,
            ),
            child: Image.asset(
              imageUrl,
              width: 24.w,
              height: 24.h,
              color: context.read<PageCubit>().state == index
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          // Container(
          //   width: 24,
          //   height: 24,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(
          //         '${imageUrl}',
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   width: 30,
          //   height: 2,
          //   decoration: BoxDecoration(
          //     color: Colors.transparent,
          //     borderRadius: BorderRadius.circular(18),
          //   ),
          // )
        ],
      ),
    );
  }
}
