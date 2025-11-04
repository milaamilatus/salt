import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSyncing = false;

  Future<void> _syncData() async {
    setState(() => _isSyncing = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _isSyncing = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sinkronisasi data berhasil!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Saya'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto profil default (tanpa gambar aset)
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blueAccent,
              child: Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Amilatus Sholehah',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Mahasiswa Teknik Informatika',
              style: TextStyle(color: Colors.grey),
            ),

            const Divider(height: 32, thickness: 1.2),

            const ListTile(
              leading: Icon(Icons.email_outlined, color: Colors.blueAccent),
              title: Text('amilatussholehah6@gmail.com'),
            ),
            const ListTile(
              leading: Icon(Icons.school_outlined, color: Colors.blueAccent),
              title: Text('Universitas Islam Madura'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on_outlined, color: Colors.blueAccent),
              title: Text('Pamekasan, Jawa Timur'),
            ),

            const SizedBox(height: 24),

            // Tombol Sinkronisasi Data
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isSyncing ? null : _syncData,
                icon: _isSyncing
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.sync),
                label: Text(
                  _isSyncing ? 'Menyinkronkan...' : 'Sinkronisasi Data',
                  style: const TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
