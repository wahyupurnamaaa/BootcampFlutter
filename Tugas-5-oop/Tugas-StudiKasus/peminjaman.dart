import 'package:intl/intl.dart';

class Peminjaman {
  final String idPeminjaman;
  final String idAnggota;
  final String idBuku;
  final DateTime tanggalPinjam;
  final DateTime batasKembali;
  DateTime? tanggalKembali;
  bool statusDikembalikan;

  Peminjaman({
    required this.idPeminjaman,
    required this.idAnggota,
    required this.idBuku,
  })  : tanggalPinjam = DateTime.now(),
        batasKembali = DateTime.now().add(const Duration(days: 14)),
        statusDikembalikan = false;

  // Method untuk mencatat pengembalian buku
  void kembalikanBuku() {
    tanggalKembali = DateTime.now();
    statusDikembalikan = true;
  }

  // Method untuk menghitung denda (jika terlambat)
  int hitungDenda() {
    if (statusDikembalikan && tanggalKembali != null) {
      if (tanggalKembali!.isAfter(batasKembali)) {
        final hariTerlambat = tanggalKembali!.difference(batasKembali).inDays;
        return hariTerlambat * 1000; // Denda Rp 1000 per hari
      }
    }
    return 0;
  }

  // Method untuk mengecek status keterlambatan
  bool get isTerlambat {
    if (!statusDikembalikan) {
      return DateTime.now().isAfter(batasKembali);
    }
    return tanggalKembali != null && tanggalKembali!.isAfter(batasKembali);
  }

  @override
  String toString() {
    final formatter = DateFormat('dd-MM-yyyy');
    final status = statusDikembalikan ? 'Sudah Dikembalikan' : 'Masih Dipinjam';
    var info = 'ID: $idPeminjaman | Anggota: $idAnggota | '
               'Buku: $idBuku | Pinjam: ${formatter.format(tanggalPinjam)} | '
               'Batas: ${formatter.format(batasKembali)} | Status: $status';
    
    if (statusDikembalikan && tanggalKembali != null) {
      info += ' | Kembali: ${formatter.format(tanggalKembali!)}';
      final denda = hitungDenda();
      if (denda > 0) {
        info += ' | Denda: Rp $denda';
      }
    }
    
    return info;
  }

  Map<String, dynamic> toMap() {
    return {
      'idPeminjaman': idPeminjaman,
      'idAnggota': idAnggota,
      'idBuku': idBuku,
      'tanggalPinjam': tanggalPinjam.toIso8601String(),
      'batasKembali': batasKembali.toIso8601String(),
      'tanggalKembali': tanggalKembali?.toIso8601String(),
      'statusDikembalikan': statusDikembalikan,
    };
  }

  factory Peminjaman.fromMap(Map<String, dynamic> map) {
    final peminjaman = Peminjaman(
      idPeminjaman: map['idPeminjaman'],
      idAnggota: map['idAnggota'],
      idBuku: map['idBuku'],
    )
      ..tanggalKembali = map['tanggalKembali'] != null 
          ? DateTime.parse(map['tanggalKembali'])
          : null
      ..statusDikembalikan = map['statusDikembalikan'];
    
    return peminjaman;
  }
}