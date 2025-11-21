void main() {
  // =============================
  // No. 1 - function teriak()
  // =============================

  print(teriak()); // "Halo Sanbers!"

  // =============================
  // No. 2 - function kalikan()
  // =============================

  int num1 = 12;
  int num2 = 4;

  int hasilKali = kalikan(num1, num2);
  print(hasilKali); // 48

  // =============================
  // No. 3 - function introduce()
  // =============================

  String name = "Agus";
  int age = 30;
  String address = "Jln. Malioboro, Yogyakarta";
  String hobby = "Gaming";

  String perkenalan = introduce(name, age, address, hobby);
  print(perkenalan);

  // =============================
  // No. 4 - function faktorial
  // =============================

  int angka = 6;
  int hasilFaktorial = faktorial(angka);
  print('$angka! = $hasilFaktorial');

  int angkaKecil = 0;
  print('$angkaKecil! = ${faktorial(angkaKecil)}'); // contoh jika <= 0
}

// No. 1
String teriak() {
  return "Halo Sanbers!";
}

// No. 2
int kalikan(int a, int b) {
  return a * b;
}

// No. 3
String introduce(String name, int age, String address, String hobby) {
  return 'Nama saya $name, umur saya $age tahun, alamat saya di $address, dan saya punya hobby yaitu $hobby!';
}

// No. 4
int faktorial(int n) {
  if (n <= 0) {
    return 1;
  }

  int hasil = 1;
  for (int i = n; i >= 1; i--) {
    hasil *= i;
  }

  return hasil;
}