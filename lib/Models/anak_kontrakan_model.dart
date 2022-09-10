import 'package:equatable/equatable.dart';

class AnakKontrakan extends Equatable {
  final int id;
  final String name;
  final int umur;
  final String alamat_asli;
  final String alamat_kontrakan;
  final int harga_perbulan;
  final String foto_muka;
  final int user_id;
  final String created;
  final String updated;

  AnakKontrakan({
    required this.id,
    required this.name,
    required this.umur,
    required this.alamat_asli,
    required this.alamat_kontrakan,
    required this.harga_perbulan,
    required this.foto_muka,
    required this.user_id,
    required this.created,
    required this.updated,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        'id',
        'name',
        'umur',
        'alamat_asli',
        'alamat_kontrakan',
        'harga_perbulan',
        'foto_muka',
        'user_id',
        'created',
        'updated'
      ];
}
