// soal3.dart

void dataHandling(List<List<String>> data) {
  for (var person in data) {
    // Asumsi urutan datanya:
    // [0] = ID
    // [1] = Nama Lengkap
    // [2] = Kota Lahir
    // [3] = Tanggal Lahir
    // [4] = Hobi

    print('Nomor ID  : ${person[0]}');
    print('Nama Lengkap : ${person[1]}');
    print('TTL       : ${person[2]}, ${person[3]}');
    print('Hobi      : ${person[4]}');
    print(''); // baris kosong pemisah
  }
}

void main() {
  List<List<String>> input = [
    ['0001', 'Roman Alamsyah', 'Bandar Lampung', '21/05/1989', 'Membaca'],
    ['0002', 'Dika Sembiring', 'Medan', '10/10/1992', 'Bermain Gitar'],
    ['0003', 'Winona', 'Ambon', '25/12/1965', 'Memasak'],
    ['0004', 'Bintang Senjaya', 'Martapura', '06/04/1970', 'Berkebun'],
  ];

  dataHandling(input);
}