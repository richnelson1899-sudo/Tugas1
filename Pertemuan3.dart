import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Aplikasi utama
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ProfilePage(),
    );
  }
}

// Halaman profile
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),

      // Isi halaman
      body: LayoutBuilder(
        builder: (context, constraints) {

          // Cek ukuran layar
          final bool isSmallScreen = constraints.maxWidth < 700;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 15 : 35,
                      vertical: 20,
                    ),
                    child: isSmallScreen
                        ? const SmallProfileLayout()
                        : const LargeProfileLayout(),
                  ),
                ),
              ),

              // Navigasi bawah
              Container(
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    // Home
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 20,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),

                    // Progress
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bar_chart_outlined,
                          size: 20,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Progress',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),

                    // Profile
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 20,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Tampilan layar kecil
class SmallProfileLayout extends StatelessWidget {
  const SmallProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 5),

        // Foto
        const ProfilePhoto(),

        const SizedBox(height: 18),

        // Nama
        const Text(
          'Rich Nelson',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 5),

        // Email
        const Text(
          'rich.825240107@stu.ac.id',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 9,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 4),

        // Lokasi
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 11,
              color: Colors.grey.shade500,
            ),
            const SizedBox(width: 3),
            Text(
              'Jakarta, Indonesia',
              style: TextStyle(
                fontSize: 9,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 45),

        // Edit Profile
        SizedBox(
          width: double.infinity,
          height: 38,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              size: 14,
            ),
            label: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Logout
        SizedBox(
          width: double.infinity,
          height: 38,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              size: 14,
            ),
            label: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade300,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Tampilan layar besar
class LargeProfileLayout extends StatelessWidget {
  const LargeProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),

        // Informasi profile
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto
            const ProfilePhoto(),

            const SizedBox(width: 25),

            // Data profile
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama
                  const Text(
                    'Rich Nelson',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Email
                  const Text(
                    'rich.825240107@stu.ac.id',
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // Lokasi
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 11,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        'Jakarta, Indonesia',
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 50),

        // Tombol
        Row(
          children: [
            // Edit Profile
            Expanded(
              child: SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    size: 14,
                  ),
                  label: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            // Logout
            Expanded(
              child: SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.logout,
                    size: 14,
                  ),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Foto profile
class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 95,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.shade50,
      ),
      child: ClipOval(
        child: Image.network(
          'https://i.pravatar.cc/300?img=12',
          fit: BoxFit.cover,
          errorBuilder: (
              BuildContext context,
              Object error,
              StackTrace? stackTrace,
              ) {
            return Container(
              color: Colors.blue.shade50,
              child: Icon(
                Icons.person,
                size: 65,
                color: Colors.grey.shade400,
              ),
            );
          },
        ),
      ),
    );
  }
}