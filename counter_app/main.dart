import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // `counter` adalah state lokal untuk menyimpan nilai pada halaman.
  // Untuk memastikan UI ter-update ketika nilainya berubah, perubahan
  // harus dilakukan di dalam pemanggilan `setState()` (lihat komentar
  // pada pemanggilan `setState()` di bawah).
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                // Memanggil `setState()` untuk mengubah state lokal.
                // Penjelasan singkat tentang `setState()`:
                // - `setState()` adalah method dari `State<T>` yang
                //   memberi tahu framework Flutter bahwa ada perubahan
                //   pada state internal sehingga widget ini perlu
                //   dibangun ulang (rebuild).
                // - `setState()` menerima sebuah callback (fungsi) yang
                //   berisi perubahan nilai state. Perubahan sebaiknya
                //   bersifat singkat; hindari kerja berat atau operasi
                //   asynchronous langsung di dalam callback `setState()`.
                // - Setelah callback dijalankan, Flutter akan menjadwalkan
                //   pemanggilan `build()` untuk memperbarui tampilan.
                // - Jangan memanggil `setState()` jika objek `State` sudah
                //   di-`dispose()` (mis. setelah widget dihapus dari tree).
                setState(() {
                  counter--;
                });
              },
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20),
            Text('Nilai Counter: $counter'),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                // Contoh lain: menambah nilai counter.
                // Di sini juga kita lakukan perubahan state di dalam
                // callback `setState()` sehingga UI akan menampilkan
                // nilai terbaru (`counter` akan diperbarui pada Text).
                setState(() {
                  counter++;
                });
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}