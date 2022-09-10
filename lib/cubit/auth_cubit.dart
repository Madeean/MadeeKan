import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:madee_kan/Services/auth_service.dart';

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

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
