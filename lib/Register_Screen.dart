import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Menggunakan background gradient yang sama
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF7F9FC), Color(0xFFF0F5FF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () {
              // Kembali ke halaman login
              Navigator.pop(context); 
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- 1. Header Pendaftaran ---
                _buildHeader(),
                const SizedBox(height: 50),

                // --- 2. Input Nama Lengkap ---
                _buildInputField(
                  label: 'Nama Lengkap',
                  hint: 'Masukkan nama lengkap Anda',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 20),

                // --- 3. Input Email ---
                _buildInputField(
                  label: 'Email',
                  hint: 'Masukkan alamat email',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 20),

                // --- 4. Input Kata Sandi ---
                _buildInputField(
                  label: 'Kata Sandi',
                  hint: 'Buat kata sandi baru',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 20),

                // --- 5. Konfirmasi Kata Sandi ---
                _buildInputField(
                  label: 'Konfirmasi Kata Sandi',
                  hint: 'Ketik ulang kata sandi',
                  icon: Icons.lock_reset_outlined,
                  isPassword: true,
                ),
                const SizedBox(height: 40),

                // --- 6. Tombol DAFTAR ---
                ElevatedButton(
                  onPressed: () {
                    print('Daftar Akun diklik');
                    // Setelah pendaftaran, bisa arahkan ke halaman utama atau login
                    Navigator.pushReplacementNamed(context, '/'); 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Daftar Akun',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),

                // --- 7. Link Kembali ke Login ---
                _buildLoginLink(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Widget Pembantu ---

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Buat Akun Baru',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Daftar untuk mulai menjelajahi ribuan buku.',
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
              prefixIcon: Icon(icon, color: const Color(0xFF2196F3)),
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

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Sudah punya akun?",
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
        TextButton(
          onPressed: () {
            // Kembali ke halaman login
            Navigator.pop(context);
          },
          child: const Text(
            'Masuk di sini',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2196F3),
            ),
          ),
        ),
      ],
    );
  }
}