void main() {
  // =============================
  // No. 1 - Looping While
  // =============================

  print('LOOPING PERTAMA');

  int i = 2;
  while (i <= 20) {
    print('$i - I love coding');
    i += 2;
  }

  print('LOOPING KEDUA');

  int j = 20;
  while (j >= 2) {
    print('$j - I will become a mobile developer');
    j -= 2;
  }

  // =============================
  // No. 2 - Looping menggunakan for
  // =============================

  for (int angka = 1; angka <= 20; angka++) {
    if (angka % 2 != 0 && angka % 3 == 0) {
      // ganjil dan kelipatan 3
      print('$angka - I Love Coding');
    } else if (angka % 2 == 0) {
      // genap
      print('$angka - Berkualitas');
    } else {
      // ganjil biasa
      print('$angka - Santai');
    }
  }

  // =============================
  // No. 3 - Persegi Panjang 8 x 4
  // =============================

  int lebar = 8;
  int tinggi = 4;

  for (int baris = 0; baris < tinggi; baris++) {
    String line = '';
    for (int kolom = 0; kolom < lebar; kolom++) {
      line += '#';
    }
    print(line);
  }

  // =============================
  // No. 4 - Tangga (#) tinggi 7
  // =============================

  int tinggiTangga = 7;

  String tangga = '';
  for (int k = 1; k <= tinggiTangga; k++) {
    tangga += '#';
    print(tangga);
  }
}