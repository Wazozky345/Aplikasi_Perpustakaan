import 'package:flutter/material.dart';

// Import MyApp jika Anda tidak menggunakan file terpisah
// import 'main.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Menggunakan background gradient yang sama dengan HomePage
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF7F9FC), Color(0xFFF0F5FF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- 1. Logo/Header ---
                _buildLogoHeader(),
                const SizedBox(height: 60),

                // --- 2. Input Email ---
                _buildInputField(
                  label: 'Email',
                  hint: 'Masukkan alamat email Anda',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 20),

                // --- 3. Input Kata Sandi ---
                _buildInputField(
                  label: 'Kata Sandi',
                  hint: 'Masukkan kata sandi',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 10),

                // --- 4. Lupa Kata Sandi ---
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implementasi navigasi ke halaman reset password
                    },
                    child: const Text(
                      'Lupa Kata Sandi?',
                      style: TextStyle(color: Color.fromARGB(255, 75, 243, 33)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // --- 5. Tombol LOGIN ---
                ElevatedButton(
                  onPressed: () {
                    // Setelah berhasil login, arahkan ke Beranda
                    Navigator.pushReplacementNamed(context, '/'); 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 68, 243, 33),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),

                // --- 6. Link Pendaftaran ---
                _buildRegisterLink(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Widget Pembantu ---

  Widget _buildLogoHeader() {
    return Column(
      children: [
        const Icon(
          Icons.menu_book, 
          size: 80, 
          color: Color.fromARGB(255, 75, 250, 31)
        ),
        const SizedBox(height: 10),
        const Text(
          'Selamat Datang',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Silakan masuk untuk melanjutkan membaca',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            obscureText: isPassword,
            keyboardType: isPassword ? TextInputType.text : TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              prefixIcon: Icon(icon, color: const Color.fromARGB(255, 80, 219, 25)),
              suffixIcon: isPassword 
                  ? IconButton(
                      icon: const Icon(Icons.visibility_off, color: Colors.grey),
                      onPressed: () {
                        // TODO: Implementasi toggle visibilitas password
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Belum punya akun?",
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
        TextButton(
          onPressed: () {
            // FIX: Mengaktifkan perintah navigasi ke halaman Register
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            'Daftar Sekarang',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 68, 243, 33),
            ),
          ),
        ),
      ],
    );
  }
}