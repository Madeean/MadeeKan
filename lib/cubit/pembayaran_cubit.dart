import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../Models/pembayaran_model.dart';

part 'pembayaran_state.dart';

class PembayaranCubit extends Cubit<PembayaranState> {
  PembayaranCubit() : super(PembayaranInitial());
}
