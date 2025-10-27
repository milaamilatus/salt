import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  String _selectedMethod = '';
  String _result = 'Belum ada metode dipilih.';
  bool _showPrediction = false;

  void _selectMethod(String method) {
    setState(() {
      _selectedMethod = method;
      _showPrediction = false;
      if (method == 'ARIMA') {
        _result =
            'Metode ARIMA dipilih.\nMAPE: 8.7%\nCocok untuk prediksi jangka pendek dengan pola stabil.';
      } else if (method == 'LSTM') {
        _result =
            'Metode LSTM dipilih.\nMAPE: 6.1%\nLebih akurat untuk pola data musiman dan jangka panjang.';
      }
    });
  }

  void _runPrediction() {
    if (_selectedMethod.isEmpty) return;
    setState(() => _showPrediction = true);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Menjalankan prediksi menggunakan $_selectedMethod...'),
        backgroundColor: Colors.blueAccent,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisis Prediksi'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pilih Metode Prediksi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Tombol Pilihan Metode
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMethodButton('ARIMA'),
                _buildMethodButton('LSTM'),
              ],
            ),
            const SizedBox(height: 25),

            // Kartu Hasil
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hasil Analisis',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(_result),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Jalankan Prediksi
            ElevatedButton.icon(
              onPressed: _selectedMethod.isEmpty ? null : _runPrediction,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Jalankan Prediksi'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 30),

            // Grafik Placeholder
            if (_showPrediction)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '📊 Grafik Prediksi ($_selectedMethod)\n\n[Placeholder Grafik]',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // 🔹 Widget tombol metode biar tidak duplikatif
  Widget _buildMethodButton(String method) {
    final bool isSelected = _selectedMethod == method;
    return ElevatedButton(
      onPressed: () => _selectMethod(method),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? Colors.blueAccent : Colors.blueGrey.shade100,
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        method,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
