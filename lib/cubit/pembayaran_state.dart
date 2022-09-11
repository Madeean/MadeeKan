part of 'pembayaran_cubit.dart';

abstract class PembayaranState extends Equatable {
  const PembayaranState();

  @override
  List<Object> get props => [];
}

class PembayaranInitial extends PembayaranState {}

class PembayaranLoading extends PembayaranState {}

class PembayaranSuccess extends PembayaranState {
  final List<PembayaranModel> pembayaran;

  PembayaranSuccess({required this.pembayaran});
  @override
  // TODO: implement props
  List<Object> get props => [pembayaran];
}

class AuthFailed extends PembayaranState {
  final String error;
  AuthFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
