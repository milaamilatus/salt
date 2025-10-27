import 'package:flutter/material.dart';
import 'PredictionPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.waves, size: 60, color: Colors.blueAccent),
            const SizedBox(height: 10),
            const Text(
              'Selamat Datang di Salt Supply Chain',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Aplikasi pemantauan dan analisis rantai pasok garam berbasis data historis.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Kartu data rantai pasok
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.bar_chart, color: Colors.blueAccent),
                title: const Text('Data Rantai Pasok Garam'),
                subtitle: const Text('Lihat data distribusi dan stok garam.'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur data belum diaktifkan'),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Tombol Analisis Prediksi
            ElevatedButton.icon(
              icon: const Icon(Icons.analytics),
              label: const Text('Mulai Analisis'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PredictionPage()),
                );
              },
            ),

            const SizedBox(height: 30),

            // Informasi tambahan di tengah
            Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'GaramChain membantu memantau ketersediaan garam\n'
                  'dan memprediksi kebutuhan dengan metode ARIMA dan LSTM.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
