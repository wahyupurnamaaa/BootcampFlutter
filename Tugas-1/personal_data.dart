void main() {
  const String nama = 'Wahyu Purnama';
  const String asal = 'Bekasi';
  const String pekerjaan = 'Payment Point di OS Ziebar';
  const String pendidikan = 'Mahasiswa semester 2 di Universitas Esa Unggul';
  const List<String> hobi = ['Ngoding', 'Bermain futsal'];

  print('========================');
  print('     DATA PRIBADI');
  print('========================');
  print('Nama        : $nama');
  print('Asal        : $asal');
  print('Kesibukan   : $pekerjaan');
  print('              $pendidikan');
  print('Hobi        : ${hobi.join(' dan ')}');
  print('========================');
}


