import 'package:equatable/equatable.dart';

DateTime today = DateTime.now();
final String dateStr = "${today.day}-${today.month}-${today.year}";

class PembayaranModel extends Equatable {
  final int id;
  final int user_id;
  final int anak_kontrakan_id;
  final int bulan;
  final String nama_pengontrak;
  final String tanggal_bayar;
  final String bukti_bayar;
  final int jumlah_bayar;
  final String status;
  final String created = dateStr;

  PembayaranModel({
    required this.id,
    required this.user_id,
    required this.anak_kontrakan_id,
    required this.bulan,
    required this.nama_pengontrak,
    required this.tanggal_bayar,
    required this.bukti_bayar,
    required this.jumlah_bayar,
    required this.status,
  });

  factory PembayaranModel.fromJson(Map<String, dynamic> json) {
    return PembayaranModel(
      id: json['id'],
      user_id: json['user_id'],
      anak_kontrakan_id: json['anak_kontrakan_id'],
      bulan: json['bulan'],
      nama_pengontrak: json['nama_pengontrak'],
      tanggal_bayar: json['tanggal_bayar'],
      bukti_bayar: json['bukti_bayar'],
      jumlah_bayar: json['jumlah_bayar'],
      status: json['status'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
