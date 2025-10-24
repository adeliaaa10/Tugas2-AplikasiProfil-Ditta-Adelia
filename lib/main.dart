import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Ukuran foto profil
  static const double profilePicRadius = 80; // Diameter 160px

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0), // Background abu-abu muda
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ## 1. BAGIAN HEADER BIRU (Dengan Tombol Kembali & Judul)
            _buildHeader(),

            // ## 2. FOTO PROFIL
            Transform.translate(
              offset: const Offset(0, -profilePicRadius / 2),
              child: CircleAvatar(
                radius: profilePicRadius,
                backgroundColor: Colors.white,
                child: const CircleAvatar( // Hapus const jika AssetImage error
                  radius: profilePicRadius - 5,
                  backgroundImage: AssetImage('assets/images/foto.png'), // Ganti nama file jika perlu
                ),
              ),
            ),

            // ## 3. BAGIAN INFO (NAMA & LOKASI)
            Transform.translate(
              offset: const Offset(0, -profilePicRadius / 2 + 10),
              child: _buildProfileInfo(),
            ),

            // ## 4. TOMBOL LIHAT DETAIL PROFIL (DIUBAH)
            const SizedBox(height: 20),
            // Mengganti ElevatedButton menjadi OutlinedButton.icon
            OutlinedButton.icon(
              onPressed: () {
                print('Tombol Detail Profil ditekan!');
              },
              icon: const Icon(Icons.info_outline, size: 20), // Ikon ditambahkan
              label: const Text(
                'Detail profil',
                style: TextStyle(fontSize: 16),
              ),
              style: OutlinedButton.styleFrom(
                // Warna teks dan border disamakan dengan warna biru header
                foregroundColor: const Color(0xFF3B80FF),
                side: const BorderSide(color: Color(0xFF3B80FF), width: 1.5), // Warna & tebal border
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Sudut melengkung
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // --- WIDGET UNTUK HEADER BIRU ---
  Widget _buildHeader() {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF3B80FF), // Warna Biru
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back, color: Colors.white, size: 28),
              Text(
                'Profil Saya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET UNTUK INFO PROFIL (NAMA & LOKASI) ---
  Widget _buildProfileInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. NAMA
          const Text(
            "Ditta Adelia",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Warna hitam
            ),
          ),
          const SizedBox(height: 10),

          // 2. SUBTITEL (Jabatan & Lokasi)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Mahasiswa",
                style: TextStyle(
                  color: Colors.grey, // Warna grey
                  fontSize: 16,
                ),
              ),
              Text(
                " | ",
                style: TextStyle(
                  color: Colors.grey.withAlpha(150), // Warna grey transparan
                  fontSize: 16,
                ),
              ),
              const Icon(
                Icons.location_on,
                color: Color(0xFF6C6C6C), // Warna ikon abu-abu
                size: 16,
              ),
              const SizedBox(width: 4),
              const Text(
                "Indonesia",
                style: TextStyle(
                  color: Colors.grey, // Warna grey
                  fontSize: 16,
                ),
              ),
            ],
          ),
          // SizedBox di bawah sini tidak diperlukan
        ],
      ),
    );
  }
}