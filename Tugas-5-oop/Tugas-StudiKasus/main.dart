import 'package:intl/intl.dart';
import 'petugas.dart';

void main() {
  // Inisialisasi petugas
  final petugas = Petugas(
    idPetugas: 'P001',
    nama: 'Budi Santoso',
    username: 'admin',
    password: 'password123',
  );
  
  // Login
  if (petugas.login('admin', 'password123')) {
    print('Login berhasil!\n');
    
    // Demo fungsi-fungsi sistem
    demoSistemPerpustakaan(petugas);
  } else {
    print('Login gagal!');
  }
}

void demoSistemPerpustakaan(Petugas petugas) {
  // 1. Tambah beberapa buku
  print('=== TAMBAH BUKU ===');
  petugas.tambahBuku(
    idBuku: 'B001',
    judul: 'Pemrograman Java',
    penulis: 'John Doe',
    kategori: 'Teknologi',
    stok: 5,
  );
  petugas.tambahBuku(
    idBuku: 'B002',
    judul: 'Struktur Data',
    penulis: 'Jane Smith',
    kategori: 'Teknologi',
    stok: 3,
  );
  petugas.tambahBuku(
    idBuku: 'B003',
    judul: 'Sejarah Indonesia',
    penulis: 'Ahmad Yani',
    kategori: 'Sejarah',
    stok: 2,
  );
  
  print('');
  
  // 2. Daftarkan anggota
  print('=== DAFTARKAN ANGGOTA ===');
  petugas.daftarkanAnggota(
    idAnggota: 'A001',
    nama: 'Andi Wijaya',
    alamat: 'Jl. Merdeka No. 123',
    nomorTelepon: '08123456789',
  );
  petugas.daftarkanAnggota(
    idAnggota: 'A002',
    nama: 'Siti Rahayu',
    alamat: 'Jl. Sudirman No. 45',
    nomorTelepon: '0876543210',
  );
  
  print('');
  
  // 3. Lihat daftar buku dan anggota
  print('=== DAFTAR BUKU ===');
  petugas.lihatDaftarBuku();
  
  print('');
  
  print('=== DAFTAR ANGGOTA ===');
  petugas.lihatDaftarAnggota();
  
  print('');
  
  // 4. Peminjaman buku
  print('=== PEMINJAMAN BUKU ===');
  petugas.catatPeminjaman(
    idPeminjaman: 'PM001',
    idAnggota: 'A001',
    idBuku: 'B001',
  );
  petugas.catatPeminjaman(
    idPeminjaman: 'PM002',
    idAnggota: 'A002',
    idBuku: 'B002',
  );
  
  print('');
  
  // 5. Lihat laporan buku yang dipinjam
  print('=== LAPORAN BUKU DIPINJAM ===');
  petugas.lihatLaporanBukuDipinjam();
  
  print('');
  
  // 6. Lihat riwayat anggota
  print('=== RIWAYAT ANGGOTA ===');
  petugas.lihatRiwayatAnggota('A001');
  
  print('');
  
  // 7. Pengembalian buku
  print('=== PENGEMBALIAN BUKU ===');
  petugas.catatPengembalian('PM001');
  
  print('');
  
  // 8. Statistik anggota
  print('=== STATISTIK ===');
  petugas.lihatStatistikAnggotaAktif();
}