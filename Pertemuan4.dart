import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // Membuat state aplikasi
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Like
  int likes = 10;

  // Status border foto
  bool selected = false;

  // Popup +1
  bool showPlusOne = false;

  // Pesan profil
  String message = '';

  @override
  Widget build(BuildContext context) {
    // Lebar layar
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      // Menghilangkan debug banner
      debugShowCheckedModeBanner: false,

      home: Scaffold(

        // App Bar
        appBar: AppBar(
          title: const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        // Body
        body: SafeArea(
          child: Container(
            // Lebar container
            width: double.infinity,

            // Jarak luar
            margin: const EdgeInsets.all(20),

            // Jarak dalam
            padding: const EdgeInsets.all(20),

            // Warna background
            color: Colors.white,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // Foto Profile
                GestureDetector(

                  // Tap Foto
                  onTapDown: (_) {
                    setState(() {
                      selected = true;
                    });
                  },

                  // Lepas Foto
                  onTapUp: (_) {
                    setState(() {
                      selected = false;
                    });
                  },

                  // Batalkan Tap
                  onTapCancel: () {
                    setState(() {
                      selected = false;
                    });
                  },

                  // Double Tap Foto
                  onDoubleTap: () {
                    setState(() {
                      likes++;
                      showPlusOne = true;
                    });

                    // Hilangkan Popup
                    Timer(
                      const Duration(milliseconds: 800),
                          () {
                        if (mounted) {
                          setState(() {
                            showPlusOne = false;
                          });
                        }
                      },
                    );
                  },

                  child: Container(
                    // Ukuran foto
                    width: 120,
                    height: 120,

                    decoration: BoxDecoration(
                      // Bentuk lingkaran
                      shape: BoxShape.circle,

                      // Border Foto
                      border: Border.all(
                        color: selected
                            ? Colors.blue
                            : Colors.transparent,
                        width: 5,
                      ),

                      // Background foto
                      color: Colors.grey.shade200,
                    ),

                    // Icon Profile
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 80,
                    ),
                  ),
                ),

                // Jarak
                const SizedBox(height: 20),

                // Nama
                GestureDetector(

                  // Long Press Nama
                  onLongPress: () {
                    setState(() {
                      message = 'Profil dipilih';
                    });
                  },

                  child: const Text(
                    'Rich Nelson',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),

                // Pesan Profil
                if (message.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Profil dipilih',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                // Jarak
                const SizedBox(height: 5),

                // Email
                const Text(
                  'rich.825240107@stu.untar.ac.id',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),

                // Jarak
                const SizedBox(height: 10),

                // Like
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Icon Like
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 23,
                    ),

                    // Jarak
                    const SizedBox(width: 6),

                    // Jumlah Like
                    Text(
                      '$likes',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Popup +1
                    if (showPlusOne)
                      Container(
                        // Jarak popup
                        margin: const EdgeInsets.only(left: 8),

                        // Ukuran popup
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),

                        decoration: BoxDecoration(
                          // Warna popup
                          color: Colors.red.shade100,

                          // Sudut popup
                          borderRadius: BorderRadius.circular(4),
                        ),

                        // Teks popup
                        child: const Text(
                          '+1',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),

                // Jarak
                const SizedBox(height: 15),

                // Edit Profile
                SizedBox(
                  // Lebar tombol
                  width: double.infinity,

                  // Tinggi tombol
                  height: 35,

                  child: ElevatedButton(
                    // Fungsi tombol
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      // Warna tombol
                      backgroundColor: Colors.blue,

                      // Warna teks
                      foregroundColor: Colors.white,

                      // Menghilangkan bayangan
                      elevation: 0,

                      // Bentuk tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    // Teks tombol
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),

                // Jarak
                const SizedBox(height: 15),

                // Data Diri
                const ProfileMenuItem(
                  icon: Icons.person,
                  title: 'Data Diri',
                ),

                // Hobi
                const ProfileMenuItem(
                  icon: Icons.favorite,
                  title: 'Hobi',
                ),

                // Tentang Saya
                const ProfileMenuItem(
                  icon: Icons.info,
                  title: 'Tentang Saya',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Menu Profile
class ProfileMenuItem extends StatelessWidget {
  // Icon menu
  final IconData icon;

  // Nama menu
  final String title;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Tinggi menu
      height: 45,

      // Lebar menu
      width: double.infinity,

      decoration: const BoxDecoration(
        // Garis bawah menu
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFEAEAEA),
            width: 0.8,
          ),
        ),
      ),

      child: Row(
        children: [

          // Icon Menu
          Icon(
            icon,
            size: 17,
            color: Colors.blueGrey,
          ),

          // Jarak
          const SizedBox(width: 12),

          // Nama Menu
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ),

          // Panah Menu
          const Icon(
            Icons.chevron_right,
            size: 19,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}