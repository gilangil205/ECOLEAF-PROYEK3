import 'package:flutter/material.dart';
import 'package:ecolreaf_mobile/screens/chatbot/chatbot_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatBotPage()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Daftar tanaman (dummy data)
  final List<Map<String, String>> plantList = [
    {"name": "Monstera", "image": "assets/tanaman/aglaonema.jpg"},
    {"name": "Kaktus", "image": "assets/images/kaktus.png"},
    {"name": "Anggrek", "image": "assets/images/anggrek.png"},
    {"name": "Lidah Mertua", "image": "assets/images/lidah_mertua.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello, User", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Text("Temukan tanaman Anda", style: TextStyle(fontSize: 14, color: Colors.black54)),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: IconButton(icon: const Icon(Icons.person), onPressed: () {}),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Search Bar
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(50), blurRadius: 10, spreadRadius: 4, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Cari tanaman",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Kategori
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text("Kategori", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _categoryButton("Di luar ruangan"),
                    const SizedBox(width: 10),
                    _categoryButton("Di dalam ruangan"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // GridView untuk menampilkan Card tanaman
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 kolom
                    crossAxisSpacing: 10, // Jarak antar kolom
                    mainAxisSpacing: 10, // Jarak antar baris
                    childAspectRatio: 1, // Rasio lebar-tinggi card
                  ),
                  itemCount: plantList.length,
                  itemBuilder: (context, index) {
                    return _plantCard(
                      plantList[index]["name"]!,
                      plantList[index]["image"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/icons/home.png', width: 24, height: 24), label: "Home"),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/pesan.png', width: 24, height: 24), label: "ChatBot"),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/setting.png', width: 24, height: 24), label: "Pengaturan"),
        ],
      ),
    );
  }

  Widget _categoryButton(String title) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(title),
    );
  }

  // CARD PLANT DENGAN SHADOW DITAMBAHKAN
  Widget _plantCard(String name, String imagePath) {
    return Column(
      children: [
        Container(
          width: 155,
          height: 155,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow lebih soft
                blurRadius: 10, // Efek blur lebih smooth
                spreadRadius: 3, // Penyebaran shadow lebih luas
                offset: const Offset(4, 6), // Posisi shadow lebih realistis
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
