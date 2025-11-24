class Lingkaran {
  static const double pi = 3.14159;

  double hitungLuas(double jariJari) {
    return pi * jariJari * jariJari;
  }
}

// Contoh penggunaan (opsional, bisa dihapus saat submit)
void main() {
  var lingkaran = Lingkaran();
  print('Luas lingkaran dengan jari-jari 5: ${lingkaran.hitungLuas(5)}');
}