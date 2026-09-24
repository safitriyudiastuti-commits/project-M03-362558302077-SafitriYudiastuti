import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String title;
  final DateTime tanggalPinjam;
  final DateTime batasPengembalian;

  const SuccessPage({
    super.key,
    required this.title,
    required this.tanggalPinjam,
    required this.batasPengembalian,
  });

  String formatTanggal(DateTime tanggal) {
    const namaBulan = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    String jam = tanggal.hour.toString().padLeft(2, '0');
    String menit = tanggal.minute.toString().padLeft(2, '0');

    return '${tanggal.day} ${namaBulan[tanggal.month - 1]} '
        '${tanggal.year}, $jam:$menit';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Peminjaman Buku'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.library_books,
                size: 100,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Peminjaman Berhasil!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 15),

            Text(
              'Buku "$title"\nberhasil dipinjam.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.calendar_month),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tanggal & Jam Pinjam',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(formatTanggal(tanggalPinjam)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Batas Pengembalian',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(formatTanggal(batasPengembalian)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(Icons.home),
                label: const Text(
                  'Kembali ke Beranda',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
