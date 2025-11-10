import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Daftar notifikasi contoh (bisa nanti diganti dari database)
    final List<Map<String, String>> notifications = [
      {
        'title': 'Prediksi Baru Tersimpan',
        'message': 'Hasil prediksi ARIMA berhasil disimpan ke database.',
        'time': '5 menit yang lalu',
        'detail': 'Model ARIMA menghasilkan akurasi 92%. Data tersimpan di tabel prediksi.'
      },
      {
        'title': 'Update Sistem',
        'message': 'Versi aplikasi telah diperbarui ke v2.1 dengan performa lebih cepat.',
        'time': '1 jam yang lalu',
        'detail': 'Perubahan meliputi perbaikan bug dan peningkatan tampilan UI.'
      },
      {
        'title': 'Sinkronisasi Data',
        'message': 'Data penjualan dan stok berhasil disinkronkan.',
        'time': 'Kemarin',
        'detail': 'Sinkronisasi berhasil tanpa error pada jam 20:45.'
      },
      {
        'title': 'Pengingat',
        'message': 'Jangan lupa lakukan pembaruan data bulanan hari ini.',
        'time': '2 hari yang lalu',
        'detail': 'Data bulanan digunakan untuk memperbarui grafik performa.'
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
                    leading: const Icon(
                      Icons.notifications_active,
                      color: Colors.blueAccent,
                    ),
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
                    // ✅ Fitur klik notifikasi → tampilkan detail di dialog
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(notif['title']!),
                            content: Text(notif['detail']!),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Tutup'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
