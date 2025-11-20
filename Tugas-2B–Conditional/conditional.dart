import 'dart:io';

void main() {
  print('=== Pilihan Soal Conditional B ===');
  print('1. Soal B1 - Ternary Operator Y/T');
  print('2. Soal B2 - Game Werewolf');
  print('3. Soal B3 - Quotes Harian');
  print('4. Soal B4 - Format Tanggal');
  stdout.write('Masukkan nomor soal yang ingin dijalankan (1-4): ');

  final pilihan = stdin.readLineSync();

  switch (pilihan) {
    case '1':
      soalB1();
      break;
    case '2':
      soalB2();
      break;
    case '3':
      soalB3();
      break;
    case '4':
      soalB4();
      break;
    default:
      print('Pilihan tidak valid. Jalankan ulang dan pilih 1-4.');
  }
}

// ===============================
// SOAL B.1 - Ternary Operator Y/T
// ===============================
void soalB1() {
  stdout.write('Apakah Anda mau menginstall aplikasi dart? (Y/T): ');
  String? input = stdin.readLineSync();

  String hasil = (input == 'Y' || input == 'y')
      ? 'anda akan menginstall aplikasi dart'
      : (input == 'T' || input == 't')
          ? 'aborted'
          : 'input tidak dikenali';

  print(hasil);
}

// =======================================
// SOAL B.2 - If Else If Else (Game Werewolf)
// =======================================
void soalB2() {
  stdout.write('Masukkan nama: ');
  String? nama = stdin.readLineSync();
  stdout.write('Masukkan peran (Penyihir/Guard/Werewolf): ');
  String? peran = stdin.readLineSync();

  nama = nama ?? '';
  peran = peran ?? '';

  if (nama.isEmpty && peran.isEmpty) {
    print('Nama harus diisi!');
  } else if (nama.isNotEmpty && peran.isEmpty) {
    print('Halo $nama, Pilih peranmu untuk memulai game!');
  } else {
    print('Selamat datang di Dunia Werewolf, $nama');

    if (peran.toLowerCase() == 'penyihir') {
      print(
          'Halo Penyihir $nama, kamu dapat melihat siapa yang menjadi werewolf!');
    } else if (peran.toLowerCase() == 'guard') {
      print(
          'Halo Guard $nama, kamu akan membantu melindungi temanmu dari serangan werewolf.');
    } else if (peran.toLowerCase() == 'werewolf') {
      print('Halo Werewolf $nama, Kamu akan memakan mangsa setiap malam!');
    } else {
      print('Peran tidak dikenal, silakan pilih Penyihir, Guard, atau Werewolf.');
    }
  }
}

// ==============================
// SOAL B.3 - Switch Quotes Harian
// ==============================
void soalB3() {
  stdout.write('Masukkan hari (Senin/Selasa/..../Minggu): ');
  String? hari = stdin.readLineSync();

  if (hari == null) return;

  switch (hari.toLowerCase()) {
    case 'senin':
      print(
          'Segala sesuatu memiliki kesudahan, yang sudah berakhir biarlah berlalu dan yakinlah semua akan baik-baik saja.');
      break;
    case 'selasa':
      print(
          'Setiap detik sangatlah berharga karena waktu mengetahui banyak hal, termasuk rahasia hati.');
      break;
    case 'rabu':
      print(
          'Jika kamu tak menemukan buku yang kamu cari di rak, maka tulislah sendiri.');
      break;
    case 'kamis':
      print(
          'Jika hatimu banyak merasakan sakit, maka belajarlah dari rasa sakit itu untuk tidak memberikan rasa sakit pada orang lain.');
      break;
    case 'jumat':
    case 'jum\'at':
      print('Hidup tak selamanya tentang pacar.');
      break;
    case 'sabtu':
      print('Rumah bukan hanya sebuah tempat, tetapi itu adalah perasaan.');
      break;
    case 'minggu':
      print(
          'Hanya seseorang yang takut yang bisa bertindak berani. Tanpa rasa takut itu tidak ada apapun yang bisa disebut berani.');
      break;
    default:
      print('Hari tidak dikenali.');
  }
}

// =============================================
// SOAL B.4 - Switch Case Format Tanggal (No I/O)
// =============================================
void soalB4() {
  var tanggal = 21;  // assign antara 1 - 31
  var bulan = 1;     // assign antara 1 - 12
  var tahun = 1945;  // assign antara 1900 - 2200

  if (tanggal < 1 || tanggal > 31) {
    print('Tanggal tidak valid');
    return;
  }
  if (tahun < 1900 || tahun > 2200) {
    print('Tahun tidak valid');
    return;
  }

  String namaBulan;

  switch (bulan) {
    case 1:
      namaBulan = 'Januari';
      break;
    case 2:
      namaBulan = 'Februari';
      break;
    case 3:
      namaBulan = 'Maret';
      break;
    case 4:
      namaBulan = 'April';
      break;
    case 5:
      namaBulan = 'Mei';
      break;
    case 6:
      namaBulan = 'Juni';
      break;
    case 7:
      namaBulan = 'Juli';
      break;
    case 8:
      namaBulan = 'Agustus';
      break;
    case 9:
      namaBulan = 'September';
      break;
    case 10:
      namaBulan = 'Oktober';
      break;
    case 11:
      namaBulan = 'November';
      break;
    case 12:
      namaBulan = 'Desember';
      break;
    default:
      namaBulan = 'Bulan tidak valid';
  }

  if (namaBulan == 'Bulan tidak valid') {
    print(namaBulan);
  } else {
    print('$tanggal $namaBulan $tahun');
  }
}