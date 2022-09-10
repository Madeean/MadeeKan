import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:madee_kan/Services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void register({
    required String name,
    required String email,
    required String password,
    required String kontrakanName,
    required int howManyRooms,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().register(
        name: name,
        email: email,
        password: password,
        kontrakanName: kontrakanName,
        howManyRooms: howManyRooms,
      );

      final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final prefs = await _prefs;
      prefs.setString('email', user.email);
      prefs.setString('token', user.token);
      prefs.setString('password', password);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final prefs = await _prefs;
      prefs.setString('email', user.email);
      prefs.setString('token', user.token);
      prefs.setString('password', password);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void logout({
    required String token,
  }) async {
    try {
      emit(AuthLoading());
      await AuthService().logout(token: token);
      final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final prefs = await _prefs;
      prefs.remove('email');
      prefs.remove('token');
      prefs.remove('password');
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
