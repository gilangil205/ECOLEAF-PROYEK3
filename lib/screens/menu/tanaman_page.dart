import 'package:flutter/material.dart';

class TanamanPage extends StatelessWidget {
  const TanamanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Proyek 3"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/dieffenbachia.png', // Pastikan path benar
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 150, color: Colors.grey);
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Dieffenbachia Camilla',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Tanaman di dalam ruangan',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              const Text(
                'Rp 15.000',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Dieffenbachia Camilla cocok untuk ditempatkan di dalam ruangan karena mampu beradaptasi dengan cahaya sedang hingga rendah. Tanaman ini juga memiliki kemampuan menyaring udara, sehingga dapat membantu meningkatkan kualitas udara di dalam rumah atau kantor. Klik Chat untuk menanyakan lebih lanjut!',
                  textAlign: TextAlign.justify,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Parameter Tanaman', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _buildParameterRow('Kadar Air', '2-3 kali dalam seminggu', Icons.water),
                    _buildParameterRow('Lembab Tanah', '40-60%', Icons.opacity),
                    _buildParameterRow('Udara', '50-70%', Icons.air),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Tambahkan logika untuk membuka chat
                },
                child: const Text('Tanyakan sekarang!', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParameterRow(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.green),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          Text(value, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
