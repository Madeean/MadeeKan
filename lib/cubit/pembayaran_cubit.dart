import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:madee_kan/Services/pembayaran_service.dart';

import '../Models/pembayaran_model.dart';

part 'pembayaran_state.dart';

class PembayaranCubit extends Cubit<PembayaranState> {
  PembayaranCubit() : super(PembayaranInitial());

  void getPembayaran({
    required String token,
  }) async {
    try {
      emit(PembayaranLoading());
      List<PembayaranModel> pembayaran =
          await PembayaranService().getAnakKontrakan(token: token);
      if (pembayaran.length > 0) {
        emit(PembayaranSuccess(pembayaran: pembayaran));
      } else {
        emit(PembayaranSuccessDataKosong());
      }
    } catch (e) {
      emit(PembayaranFailed(e.toString()));
    }
  }
}
