import 'dart:async';

void main() {
  print('luffy');
  print('zoro');
  print('killer');
  
  // Memanggil fungsi asynchronous
  getData().then((result) {
    print(result);
  });
}

Future<String> getData() async {
  // Menunggu 3 detik
  await Future.delayed(Duration(seconds: 3));
  return 'get data [done], name 3: Rafi';
}