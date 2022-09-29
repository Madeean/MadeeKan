import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madee_kan/Home/landing_page.dart';
import 'package:madee_kan/cubit/auth_cubit.dart';
import 'package:madee_kan/cubit/page_cubit.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is AuthFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthSuccess) {
                return UserAccountsDrawerHeader(
                  accountName: Text(state.user.name),
                  accountEmail: Text(state.user.email),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/backgroud-small.jpg'),
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
          ListTile(
            leading: Image.asset('assets/plus.png', height: 20.h),
            title: Text('Tambah Pembayaran'),
            onTap: () {
              context.read<PageCubit>().setPage(1);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => LandingPage()));
            },
          ),
          ListTile(
            leading: Image.asset('assets/cross-circle.png', height: 20.h),
            title: Text('Daftar Belum Lunas'),
            onTap: () {
              context.read<PageCubit>().setPage(3);
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/list.png',
              height: 20.h,
            ),
            title: Text('Daftar Orang Ngontrak'),
            onTap: () {
              context.read<PageCubit>().setPage(2);
            },
          ),
        ],
      ),
    );
  }
}
