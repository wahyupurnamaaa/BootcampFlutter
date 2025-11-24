class Buku {
  final String idBuku;
  String judul;
  String penulis;
  String kategori;
  int stok;
  bool statusKetersediaan;

  Buku({
    required this.idBuku,
    required this.judul,
    required this.penulis,
    required this.kategori,
    required this.stok,
  }) : statusKetersediaan = stok > 0;

  // Method untuk mengurangi stok saat buku dipinjam
  void pinjamBuku() {
    if (stok > 0) {
      stok--;
      if (stok == 0) {
        statusKetersediaan = false;
      }
    }
  }

  // Method untuk menambah stok saat buku dikembalikan
  void kembalikanBuku() {
    stok++;
    statusKetersediaan = true;
  }

  // Method untuk mengedit informasi buku
  void editBuku({
    required String judul,
    required String penulis,
    required String kategori,
    required int stok,
  }) {
    this.judul = judul;
    this.penulis = penulis;
    this.kategori = kategori;
    this.stok = stok;
    statusKetersediaan = stok > 0;
  }

  @override
  String toString() {
    return 'ID: $idBuku | Judul: $judul | Penulis: $penulis | '
           'Kategori: $kategori | Stok: $stok | '
           'Tersedia: ${statusKetersediaan ? "Ya" : "Tidak"}';
  }

  Map<String, dynamic> toMap() {
    return {
      'idBuku': idBuku,
      'judul': judul,
      'penulis': penulis,
      'kategori': kategori,
      'stok': stok,
      'statusKetersediaan': statusKetersediaan,
    };
  }

  factory Buku.fromMap(Map<String, dynamic> map) {
    return Buku(
      idBuku: map['idBuku'],
      judul: map['judul'],
      penulis: map['penulis'],
      kategori: map['kategori'],
      stok: map['stok'],
    );
  }
}