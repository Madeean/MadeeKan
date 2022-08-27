import 'package:flutter/material.dart';
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
            margin: EdgeInsets.only(
              top: width * 0.06,
            ),
            child: Image.asset(
              imageUrl,
              width: 24,
              height: 24,
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
