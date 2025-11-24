class Lingkaran {
  double _jariJari = 0;

  // Setter dengan validasi
  set jariJari(double value) {
    _jariJari = value < 0 ? value * -1 : value;
  }

  // Getter
  double get jariJari => _jariJari;

  // Hitung luas
  double hitungLuas() {
    return 3.14159 * _jariJari * _jariJari;
  }
}