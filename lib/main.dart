import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aplikasi Profil', // Judul tab browser
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Background diubah jadi putih
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ## 1. BAGIAN HEADER BIRU
            _buildHeader(),

            // ## 2. FOTO PROFIL
            Transform.translate(
              offset: const Offset(0, -profilePicRadius / 2),
              child: CircleAvatar(
                radius: profilePicRadius,
                backgroundColor: Colors.white,
                child: const CircleAvatar(
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

            // ## 4. BAGIAN FORM FIELDS (TAMBAHAN)
            // Beri jarak dari info profil
            const SizedBox(height: 10), // Jarak dikurangi sedikit
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), // Padding kiri-kanan
              child: Column(
                children: [
                  _buildInfoField(label: "Nama Lengkap", value: "Ditta Adelia"),
                  const SizedBox(height: 15),
                  _buildInfoField(label: "Email", value: "ditta.adelia@gmail.com"),
                  const SizedBox(height: 15),
                  _buildInfoField(label: "Alamat", value: "Jawa Timur, Indonesia"),
                  const SizedBox(height: 15),
                  
                ],
              ),
            ),


            // ## 5. TOMBOL LIHAT DETAIL PROFIL
            OutlinedButton.icon(
              onPressed: () {
                print('Tombol Edit Profil ditekan!');
                 // Menampilkan SnackBar (pop-up)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menampilkan Edit profil...'), // Pesan pop-up
                    duration: Duration(seconds: 5), // Berapa lama tampil
                    behavior: SnackBarBehavior.floating, // Posisi mengambang
                    margin: EdgeInsets.all(20), // Jarak dari tepi layar
                  ),
                );
              },
              icon: const Icon(Icons.info_outline, size: 20),
              label: const Text(
                'Edit profil',
                style: TextStyle(fontSize: 16),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF3B80FF),
                side: const BorderSide(color: Color(0xFF3B80FF), width: 1.5),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
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
      height: 200, // Tinggi ditambah sedikit
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

          // 2. SUBTITEL
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
        ],
      ),
    );
  }

  // --- WIDGET HELPER UNTUK MEMBUAT SATU FORM FIELD (BARU) ---
  Widget _buildInfoField({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label (identitas)
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),
        const SizedBox(height: 5),

        // Kotak yang berisi value
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white, // Background kotak putih
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade200), // Border abu-abu muda
          ),
          child: Text( // Hanya menampilkan teks value
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}