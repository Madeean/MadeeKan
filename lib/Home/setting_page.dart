import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/Auth/login_page.dart';
import 'package:madee_kan/Home/edit_profile_page.dart';
import 'package:madee_kan/Home/home_page.dart';
import 'package:madee_kan/cubit/auth_cubit.dart';
import 'package:madee_kan/cubit/page_cubit.dart';

import '../Widgets/custom_setting_card.dart';
import 'navbar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.blue, fontSize: 22.sp),
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
          if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AuthSuccess) {
            return Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${state.user.name}',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '${state.user.email}',
                          style: TextStyle(
                            fontSize: 22.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 20.h),
                      CustomSettingCard(
                        title: 'Edit Profile',
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()),
                          );
                        },
                      ),
                      CustomSettingCard(
                        title: 'Logout',
                        onTap: () {
                          context
                              .read<AuthCubit>()
                              .logout(token: state.user.token);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

// ListView(
//         children: [
//           Column(
//             children: [
//               Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                     top: 20.h,
//                     left: 24.w,
//                     right: 24.w,
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Made Reihan Diva Suarna',
//                         style: TextStyle(
//                           fontSize: 24.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       Text(
//                         'Madee@gmail.com',
//                         style: TextStyle(
//                           fontSize: 22.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Card(
//                 child: InkWell(
//                   splashColor: Colors.blue.withAlpha(30),
//                   onTap: () async {
//                     await Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginPage()),
//                         (route) => false);
//                   },
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: 70.h,
//                     child: Container(
//                       padding: EdgeInsets.only(
//                         left: 24.w,
//                         right: 24.w,
//                       ),
//                       alignment: Alignment.centerLeft,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Logout',
//                           ),
//                           Icon(
//                             Icons.chevron_right,
//                             color: Colors.grey.shade700,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
