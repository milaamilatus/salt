import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'title': 'Prediksi Baru Tersimpan',
        'message': 'Hasil prediksi ARIMA berhasil disimpan ke database.',
        'time': '5 menit yang lalu',
      },
      {
        'title': 'Sinkronisasi Data',
        'message': 'Data terbaru dari rantai pasok garam telah diperbarui.',
        'time': '2 jam yang lalu',
      },
      {
        'title': 'Pembaruan Sistem',
        'message': 'Versi aplikasi GaramChain telah diperbarui ke 1.2.0.',
        'time': 'Kemarin',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                'Belum ada notifikasi saat ini.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notif = notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.notifications_active,
                        color: Colors.blueAccent),
                    title: Text(
                      notif['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(notif['message']!),
                    trailing: Text(
                      notif['time']!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
