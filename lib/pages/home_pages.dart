import 'package:flutter/material.dart';
import 'detail_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.menu_book),
            SizedBox(width: 10),
            Text('Perpustakaan Kampus'),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          bookCard(
            context,
            'Pemrograman Flutter',
            'Andi Saputra',
            'Tersedia: 3 Buku',
            'https://www.google.com',
          ),

          bookCard(
            context,
            'Dasar Dart',
            'Budi Santoso',
            'Tersedia: 5 Buku',
            'https://www.google.com',
          ),

          bookCard(
            context,
            'Desain UI/UX',
            'Citra Lestari',
            'Tersedia: 2 Buku',
            'https://www.google.com',
          ),
        ],
      ),
    );
  }

  Widget bookCard(BuildContext context,
      String title,
      String author,
      String stock,
      String link,) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.menu_book,
                size: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    author,
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    stock,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(
                                  title: title,
                                  author: author,
                                  stock: stock,
                                  link: link,
                                ),
                          ),
                        );
                      },
                      child: const Text('Lihat Detail'),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}