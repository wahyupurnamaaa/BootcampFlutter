class Anggota {
  final String idAnggota;
  String nama;
  String alamat;
  String nomorTelepon;
  List<String> riwayatPeminjaman;

  Anggota({
    required this.idAnggota,
    required this.nama,
    required this.alamat,
    required this.nomorTelepon,
  }) : riwayatPeminjaman = [];

  // Method untuk mengedit informasi anggota
  void editAnggota({
    required String nama,
    required String alamat,
    required String nomorTelepon,
  }) {
    this.nama = nama;
    this.alamat = alamat;
    this.nomorTelepon = nomorTelepon;
  }

  // Method untuk menambah riwayat peminjaman
  void tambahRiwayat(String infoPeminjaman) {
    riwayatPeminjaman.add(infoPeminjaman);
  }

  // Method untuk melihat riwayat peminjaman
  void lihatRiwayat() {
    if (riwayatPeminjaman.isEmpty) {
      print('Belum ada riwayat peminjaman untuk $nama');
    } else {
      print('Riwayat Peminjaman $nama:');
      for (int i = 0; i < riwayatPeminjaman.length; i++) {
        print('${i + 1}. ${riwayatPeminjaman[i]}');
      }
    }
  }

  @override
  String toString() {
    return 'ID: $idAnggota | Nama: $nama | Alamat: $alamat | Telepon: $nomorTelepon';
  }

  Map<String, dynamic> toMap() {
    return {
      'idAnggota': idAnggota,
      'nama': nama,
      'alamat': alamat,
      'nomorTelepon': nomorTelepon,
      'riwayatPeminjaman': riwayatPeminjaman,
    };
  }

  factory Anggota.fromMap(Map<String, dynamic> map) {
    return Anggota(
      idAnggota: map['idAnggota'],
      nama: map['nama'],
      alamat: map['alamat'],
      nomorTelepon: map['nomorTelepon'],
    )..riwayatPeminjaman = List<String>.from(map['riwayatPeminjaman'] ?? []);
  }
}