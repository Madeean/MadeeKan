import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:madee_kan/Models/anak_kontrakan_model.dart';
import 'package:madee_kan/Services/kontrakan_service.dart';

part 'kontrakan_state.dart';

class KontrakanCubit extends Cubit<KontrakanState> {
  KontrakanCubit() : super(KontrakanInitial());

  void addKontrakan({
    required String name,
    required int umur,
    required String alamat_asli,
    required String alamat_kontrakan,
    required int harga_perbulan,
    required String foto_muka,
    required String token,
  }) async {
    try {
      emit(KontrakanLoading());
      await KontrakanService().addAnakKontrakan(
        alamat_asli: alamat_asli,
        alamat_kontrakan: alamat_kontrakan,
        harga_perbulan: harga_perbulan,
        foto_muka: foto_muka,
        name: name,
        token: token,
        umur: umur,
      );
      emit(addAnakKontrakanSuccess());
    } catch (e) {
      emit(KontrakanFailed(e.toString()));
    }
  }
}
