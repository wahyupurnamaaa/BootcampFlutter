import 'package:intl/intl.dart';
import 'anggota.dart';
import 'buku.dart';
import 'peminjaman.dart';

class Petugas {
  final String idPetugas;
  final String nama;
  final String username;
  final String password;
  List<Buku> daftarBuku;
  List<Anggota> daftarAnggota;
  List<Peminjaman> daftarPeminjaman;

  Petugas({
    required this.idPetugas,
    required this.nama,
    required this.username,
    required this.password,
  })  : daftarBuku = [],
        daftarAnggota = [],
        daftarPeminjaman = [];

  // Method autentikasi
  bool login(String username, String password) {
    return this.username == username && this.password == password;
  }

  // === MANAJEMEN BUKU ===
  
  // Menambah buku
  void tambahBuku({
    required String idBuku,
    required String judul,
    required String penulis,
    required String kategori,
    required int stok,
  }) {
    final bukuBaru = Buku(
      idBuku: idBuku,
      judul: judul,
      penulis: penulis,
      kategori: kategori,
      stok: stok,
    );
    daftarBuku.add(bukuBaru);
    print('Buku berhasil ditambahkan: $judul');
  }

  // Menghapus buku
  void hapusBuku(String idBuku) {
    final buku = cariBukuById(idBuku);
    if (buku != null) {
      daftarBuku.remove(buku);
      print('Buku berhasil dihapus: ${buku.judul}');
    } else {
      print('Buku dengan ID $idBuku tidak ditemukan');
    }
  }

  // Mengedit buku
  void editBuku({
    required String idBuku,
    required String judul,
    required String penulis,
    required String kategori,
    required int stok,
  }) {
    final buku = cariBukuById(idBuku);
    if (buku != null) {
      buku.editBuku(
        judul: judul,
        penulis: penulis,
        kategori: kategori,
        stok: stok,
      );
      print('Buku berhasil diupdate: $judul');
    } else {
      print('Buku dengan ID $idBuku tidak ditemukan');
    }
  }

  // Mencari buku by ID
  Buku? cariBukuById(String idBuku) {
    try {
      return daftarBuku.firstWhere((buku) => buku.idBuku == idBuku);
    } catch (e) {
      return null;
    }
  }

  // Melihat daftar buku
  void lihatDaftarBuku() {
    if (daftarBuku.isEmpty) {
      print('Tidak ada buku dalam sistem');
    } else {
      print('=== DAFTAR BUKU ===');
      for (final buku in daftarBuku) {
        print(buku);
      }
    }
  }

  // === MANAJEMEN ANGGOTA ===
  
  // Mendaftarkan anggota baru
  void daftarkanAnggota({
    required String idAnggota,
    required String nama,
    required String alamat,
    required String nomorTelepon,
  }) {
    final anggotaBaru = Anggota(
      idAnggota: idAnggota,
      nama: nama,
      alamat: alamat,
      nomorTelepon: nomorTelepon,
    );
    daftarAnggota.add(anggotaBaru);
    print('Anggota berhasil didaftarkan: $nama');
  }

  // Menghapus anggota
  void hapusAnggota(String idAnggota) {
    final anggota = cariAnggotaById(idAnggota);
    if (anggota != null) {
      daftarAnggota.remove(anggota);
      print('Anggota berhasil dihapus: ${anggota.nama}');
    } else {
      print('Anggota dengan ID $idAnggota tidak ditemukan');
    }
  }

  // Mengedit anggota
  void editAnggota({
    required String idAnggota,
    required String nama,
    required String alamat,
    required String nomorTelepon,
  }) {
    final anggota = cariAnggotaById(idAnggota);
    if (anggota != null) {
      anggota.editAnggota(
        nama: nama,
        alamat: alamat,
        nomorTelepon: nomorTelepon,
      );
      print('Anggota berhasil diupdate: $nama');
    } else {
      print('Anggota dengan ID $idAnggota tidak ditemukan');
    }
  }

  // Mencari anggota by ID
  Anggota? cariAnggotaById(String idAnggota) {
    try {
      return daftarAnggota.firstWhere((anggota) => anggota.idAnggota == idAnggota);
    } catch (e) {
      return null;
    }
  }

  // Melihat daftar anggota
  void lihatDaftarAnggota() {
    if (daftarAnggota.isEmpty) {
      print('Tidak ada anggota terdaftar');
    } else {
      print('=== DAFTAR ANGGOTA ===');
      for (final anggota in daftarAnggota) {
        print(anggota);
      }
    }
  }

  // === MANAJEMEN PEMINJAMAN ===
  
  // Mencatat peminjaman
  void catatPeminjaman({
    required String idPeminjaman,
    required String idAnggota,
    required String idBuku,
  }) {
    final anggota = cariAnggotaById(idAnggota);
    final buku = cariBukuById(idBuku);
    
    if (anggota == null) {
      print('Anggota dengan ID $idAnggota tidak ditemukan');
      return;
    }
    
    if (buku == null) {
      print('Buku dengan ID $idBuku tidak ditemukan');
      return;
    }
    
    if (!buku.statusKetersediaan) {
      print('Buku ${buku.judul} tidak tersedia');
      return;
    }
    
    final peminjaman = Peminjaman(
      idPeminjaman: idPeminjaman,
      idAnggota: idAnggota,
      idBuku: idBuku,
    );
    daftarPeminjaman.add(peminjaman);
    buku.pinjamBuku();
    
    // Tambah ke riwayat anggota
    final formatter = DateFormat('dd-MM-yyyy');
    final riwayat = 'Meminjam ${buku.judul} pada ${formatter.format(peminjaman.tanggalPinjam)}';
    anggota.tambahRiwayat(riwayat);
    
    print('Peminjaman berhasil dicatat: ${buku.judul} oleh ${anggota.nama}');
  }

  // Mencatat pengembalian
  void catatPengembalian(String idPeminjaman) {
    final peminjaman = cariPeminjamanById(idPeminjaman);
    
    if (peminjaman == null) {
      print('Peminjaman dengan ID $idPeminjaman tidak ditemukan');
      return;
    }
    
    if (peminjaman.statusDikembalikan) {
      print('Buku sudah dikembalikan sebelumnya');
      return;
    }
    
    final buku = cariBukuById(peminjaman.idBuku);
    final anggota = cariAnggotaById(peminjaman.idAnggota);
    
    peminjaman.kembalikanBuku();
    buku?.kembalikanBuku();
    
    // Update riwayat anggota
    final formatter = DateFormat('dd-MM-yyyy');
    final riwayat = 'Mengembalikan ${buku?.judul} pada ${formatter.format(peminjaman.tanggalKembali!)}';
    anggota?.tambahRiwayat(riwayat);
    
    final denda = peminjaman.hitungDenda();
    if (denda > 0) {
      print('Pengembalian berhasil. Denda yang harus dibayar: Rp $denda');
    } else {
      print('Pengembalian berhasil. Tidak ada denda');
    }
  }

  // Mencari peminjaman by ID
  Peminjaman? cariPeminjamanById(String idPeminjaman) {
    try {
      return daftarPeminjaman.firstWhere((peminjaman) => peminjaman.idPeminjaman == idPeminjaman);
    } catch (e) {
      return null;
    }
  }

  // Melihat riwayat peminjaman anggota
  void lihatRiwayatAnggota(String idAnggota) {
    final anggota = cariAnggotaById(idAnggota);
    if (anggota != null) {
      anggota.lihatRiwayat();
    } else {
      print('Anggota dengan ID $idAnggota tidak ditemukan');
    }
  }

  // === LAPORAN DAN STATISTIK ===
  
  // Melihat laporan buku yang dipinjam
  void lihatLaporanBukuDipinjam() {
    print('=== BUKU YANG SEDANG DIPINJAM ===');
    bool adaPeminjaman = false;
    
    for (final peminjaman in daftarPeminjaman) {
      if (!peminjaman.statusDikembalikan) {
        print(peminjaman);
        adaPeminjaman = true;
      }
    }
    
    if (!adaPeminjaman) {
      print('Tidak ada buku yang sedang dipinjam');
    }
  }

  // Melihat statistik anggota aktif
  void lihatStatistikAnggotaAktif() {
    final totalAnggota = daftarAnggota.length;
    final anggotaAktif = daftarAnggota.where((anggota) => anggota.riwayatPeminjaman.isNotEmpty).length;
    
    print('=== STATISTIK ANGGOTA ===');
    print('Total Anggota: $totalAnggota');
    print('Anggota Aktif: $anggotaAktif');
    print('Persentase Aktif: ${totalAnggota > 0 ? (anggotaAktif * 100 / totalAnggota).toStringAsFixed(1) : "0"}%');
  }

  @override
  String toString() {
    return 'Petugas: $nama (ID: $idPetugas)';
  }
}