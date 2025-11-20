import 'dart:io';

void main() {
  stdout.writeln('=== Pilih Soal Yang Ingin Dijalankan ===');
  stdout.writeln('1. Soal A1 - Kalimat');
  stdout.writeln('2. Soal A2 - Mengurai kalimat');
  stdout.writeln('3. Soal A3 - Input nama');
  stdout.writeln('4. Soal A4 - Operasi aritmatika');
  stdout.write('Masukkan pilihan (1-4): ');

  final String? input = stdin.readLineSync();
  switch (input) {
    case '1':
      soalA1();
      break;
    case '2':
      soalA2();
      break;
    case '3':
      soalA3();
      break;
    case '4':
      soalA4();
      break;
    default:
      stdout.writeln('Pilihan tidak dikenal. Jalankan ulang program dan pilih 1-4.');
  }
}

// ==================
// SOAL A.1 - Kalimat
// ==================
void soalA1() {
  var word = 'dart';
  var second = 'is';
  var third = 'awesome';
  var fourth = 'and';
  var fifth = 'I';
  var sixth = 'love';
  var seventh = 'it!';

  var sentence =
      '${word[0].toUpperCase()}${word.substring(1)} $second $third $fourth $fifth $sixth $seventh';

  print(sentence); // Dart is awesome and I love it!
}

// ===================================
// SOAL A.2 - Mengurai kalimat (String)
// ===================================
void soalA2() {
  var sentence = "I am going to be Flutter Developer";

  var firstWord = sentence[0]; // 'I'
  var secondWord = sentence[2] + sentence[3]; // 'am'
  var thirdWord = sentence[5] +
      sentence[6] +
      sentence[7] +
      sentence[8] +
      sentence[9]; // going
  var fourthWord = sentence[11] + sentence[12]; // to
  var fifthWord = sentence[14] + sentence[15]; // be
  var sixthWord = sentence[17] +
      sentence[18] +
      sentence[19] +
      sentence[20] +
      sentence[21] +
      sentence[22] +
      sentence[23]; // Flutter
  var seventhWord = sentence[25] +
      sentence[26] +
      sentence[27] +
      sentence[28] +
      sentence[29] +
      sentence[30] +
      sentence[31] +
      sentence[32] +
      sentence[33]; // Developer

  print('First word: $firstWord');
  print('Second word: $secondWord');
  print('Third word: $thirdWord');
  print('Fourth word: $fourthWord');
  print('Fifth word: $fifthWord');
  print('Sixth word: $sixthWord');
  print('Seventh word: $seventhWord');
}

// ==========================================
// SOAL A.3 - I/O Nama Depan & Nama Belakang
// ==========================================
void soalA3() {
  stdout.write('masukan nama depan : ');
  String? firstName = stdin.readLineSync();

  stdout.write('masukan nama belakang : ');
  String? lastName = stdin.readLineSync();

  print('');
  print('nama lengkap anda adalah:');
  print('${firstName ?? ''} ${lastName ?? ''}');
}

// ==========================================
// SOAL A.4 - Operasi Aritmatika a dan b
// ==========================================
void soalA4() {
  int a = 5;
  int b = 10;

  int perkalian = a * b;
  int penjumlahan = a + b;
  int pengurangan = a - b;
  double pembagian = a / b;

  print('a * b = $a * $b = $perkalian');
  print('a + b = $a + $b = $penjumlahan');
  print('a - b = $a - $b = $pengurangan');
  print('a / b = $a / $b = $pembagian');
}