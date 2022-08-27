import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/cubit/page_cubit.dart';

import 'Auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 782),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ),
      ),
    );
  }
}
