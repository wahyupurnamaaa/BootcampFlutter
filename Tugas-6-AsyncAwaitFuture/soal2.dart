void main() {
  // Menggunakan Future.delayed tanpa async await
  Future.delayed(Duration.zero, () {
    print('life');
  }).then((_) {
    return Future.delayed(Duration(seconds: 1), () {
      print('is');
    });
  }).then((_) {
    return Future.delayed(Duration(seconds: 1), () {
      print('never');
    });
  }).then((_) {
    return Future.delayed(Duration(seconds: 1), () {
      print('flat');
    });
  });
}