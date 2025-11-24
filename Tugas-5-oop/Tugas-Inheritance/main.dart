import 'lingkaran.dart';

void main() {
  var lingkaran = Lingkaran();
  
  // Contoh input negatif
  lingkaran.jariJari = -7;
  
  print('Jari-jari setelah validasi: ${lingkaran.jariJari}');
  print('Luas lingkaran: ${lingkaran.hitungLuas()}');
}