import 'package:flutter/material.dart';
import 'success_pages.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String author;
  final String stock;
  final String link;

  const DetailPage({
    super.key,
    required this.title,
    required this.author,
    required this.stock,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Detail Buku'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 170,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Icon(Icons.menu_book, size: 50, color: Colors.white),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text(
              'Penulis       : $author',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            const Text('Tahun Terbit  : 2024', style: TextStyle(fontSize: 16)),

            const SizedBox(height: 8),

            const Text(
              'Kategori      : Teknologi',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              'Deskripsi     : Buku $title membahas materi yang berkaitan dengan teknologi dan pemrograman.',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                stock,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Link Buku:\n$link',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Mengambil tanggal dan jam saat tombol ditekan
                  final DateTime tanggalPinjam = DateTime.now();

                  // Batas pengembalian 7 hari setelah peminjaman
                  final DateTime batasPengembalian = tanggalPinjam.add(
                    const Duration(days: 7),
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessPage(
                        title: title,
                        tanggalPinjam: tanggalPinjam,
                        batasPengembalian: batasPengembalian,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.menu_book),
                label: const Text(
                  'Pinjam Buku',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali', style: TextStyle(fontSize: 17)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
