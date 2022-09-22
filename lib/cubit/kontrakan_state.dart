part of 'kontrakan_cubit.dart';

abstract class KontrakanState extends Equatable {
  const KontrakanState();

  @override
  List<Object> get props => [];
}

class KontrakanInitial extends KontrakanState {}

class KontrakanLoading extends KontrakanState {}

class KontrakanSuccess extends KontrakanState {
  final AnakKontrakan anakKontrakan;
  KontrakanSuccess(this.anakKontrakan);

  @override
  // TODO: implement props
  List<Object> get props => [anakKontrakan];
}

class KontrakanFailed extends KontrakanState {
  final String error;
  KontrakanFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class addAnakKontrakanSuccess extends KontrakanState {}

class getAnakKontrakanSuccess extends KontrakanState {
  final List<AnakKontrakan> anakKontrakan;
  getAnakKontrakanSuccess(this.anakKontrakan);

  @override
  // TODO: implement props
  List<Object> get props => [anakKontrakan];
}

class hapusAnakKontrakanSuccess extends KontrakanState {}
