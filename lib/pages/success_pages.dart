import 'package:flutter/material.dart';
import 'home_pages.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Success Pendaftaran Diterima!',
              style: TextStyle(fontSize: 24),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                      (route) => route.isFirst,
                );
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}