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

  factory AnakKontrakan.fromJson(Map<String, dynamic> json) {
    return AnakKontrakan(
      id: json['id'],
      name: json['name'],
      umur: json['umur'],
      alamat_asli: json['alamat_asli'],
      alamat_kontrakan: json['alamat_kontrakan'],
      harga_perbulan: json['harga_perbulan'],
      foto_muka: json['foto_muka'],
      user_id: json['user_id'],
      created: json['created'],
      updated: json['updated'],
    );
  }

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
