

import 'package:apk_perpus/Register_Screen.dart';
import 'package:apk_perpus/Login_Screen.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:apk_perpus/widget/book_card.dart';


void main() {
  runApp(const MyApp());
}

// --------------------------------------------------------------------------
// --- DEFINISI KELAS WIDGET YANG DIBUTUHKAN (PENTING UNTUK RUTE) ---
// --------------------------------------------------------------------------

// --- DATA MODEL Sederhana untuk Buku (DIPERBARUI DENGAN ISBN & SIZE) ---
class Book {
  final String title;
  final String author;
  final String genre;
  final String description; 
  final double rating; 
  final int reviewCount; 
  final String imagePath;
  // Detail Tambahan yang Diperbarui:
  final String publisher; 
  final int publicationYear; 
  final int pageCount; 
  final String isbn; // BARU
  final String size; // BARU

  Book(this.title, this.author, this.genre, this.description, this.rating, this.reviewCount, this.imagePath, this.publisher, this.publicationYear, this.pageCount, this.isbn, this.size);
}

// 📚 Data Dummy (DIPISAHKAN MENJADI 3 BAGIAN UNTUK REKOMENDASI & TERBARU)
// Menggunakan 3 daftar terpisah untuk kontrol tampilan yang berbeda

final List<Book> rekomendasiBooks = [
  Book(
    '25-Dongeng-Anak-Favorit-dari-Seluruh-Dunia', 
    'Kak Adit, Kak Arin, dan Kak Latif', 
    'Fiksi', 
    'Buku 25 Dongeng Anak Favorit dari Seluruh Dunia ini berisi kumpulan dongeng berjumlah 25 cerita yang berasal dari seluruh antero dunia ini. Dengan adanya buku ini, diharapkan menambah wawasan anak terhadap dunia sosial dan memperkokoh jiwa moral anak.',
    4.5, 
    1240, 
    'assets/25-Dongeng-Anak-Favorit-dari-Seluruh-Dunia-150x213.jpg',
    'Trans Idea Publishing', 
    2020, 
    178,
    '978-602-0808-37-6', // ISBN
    '17×24 cm', // UKURAN
  ),
  Book(
    'Akibat Perbuatan Edo dan Teman-teman', 
    'Siti Munfarijah', 
    'Tech', 
    'Dalam menjalani kehidupan kita tentu pernah berbuat kesalahan yang kadang kita sengaja maupun tidak disengaja. Dalam buku ini mengisahkan tentang Perbuatan Edo dan teman-temannya baik disengaja maupun tidak sengaja, yang berakibat tidak baik dan membuat Edo dan teman-temannya menyesal dan merasa tidak nyaman akibat perbuatannya sendiri. Dengan mengetahui kesalahannya, Edo dan teman-temannya berjanji untuk tidak mengulangi lagi.',
    4.6, 
    4500,
    'assets/Akibat Perbuatan Edo dan Teman-teman.jpg',
    'Pustaka Anak', 
    2018, 
    243,
    '978-602-51806-0-6',
    '14 X 21cm',
  ),
  Book(
    'Asteroid-dari-Namamu', 
    'Galeh Pramudianto', 
    'Astronomi', 
    'Dunia adalah kawasan festival dengan berbagai wahana permainan. Seseorang datang dengan tiket pas bebas. Ia lalu mencoba semua wahana. Baginya semuanya menantang, semua mengasyikkan, dan semuanya mengantarkannya pada situasi yang hampir sampai. Wahana-wahana permainan itu membawanya menjelajah ke mana-mana, dan itulah yang ia inginkan. Ia bergerak ke masa lalu yang jauh. Ia mencapai dasar lautan. Ia mencoba tiba di batas angkasa luar, mengalami hujan asteroid, mendengar dentuman besar',
    4.9, 
    8900, 
    'assets/Asteroid-dari-Namamu.jpg',
    'Basabasi', 
    2019, 
    128, 
    '978-602-5783-65-4',
    '14 X 20 cm',
  ),
  Book(
    'Instalasi Pandangan Miring', 
    'Astrajingga Asmasubrata', 
    'Fiksi', 
    'sunyi yang masih merah berkerumun di lengkung bulan dalam benak yang sajak kata-kata ditiriskan dari cuaca sebelum disepuh bermacam warna dan pendar cahaya sebuah sabda membalut luka, membasuh duka rakaat yang terlunta sepanjang hayat lalu muncullah larik sajak itu: “sunyi menemukan tempat istirahatnya :disana”',
    4.9, 
    8900, 
    'assets/Instalasi Pandangan Miring.jpg',
    'Basa Basi', 
    2018, 
    115, 
    '978-602-5783-35-7',
    '14 X 20 cm',
  ),
  Book(
    'Isabel Alende', 
    'Prof. Kosmos', 
    'Fiksi', 
    'Sebuah eksplorasi mendalam mengenai teori-teori lubang hitam, radiasi Hawking, dan nasib bintang-bintang di galaksi kita.',
    4.9, 
    8900, 
    'assets/Isabel Alende.jpg',
    'Galaksi Pustaka', 
    2024, 
    520, 
    '978-602-6657-65-7',
    '16 X 24 cm',
  ),
  Book(
    'Jalan Keempat', 
    ' M Faizi', 
    'Fiksi', 
    'tidak ada yang benar-benar baru di bawah matahari”, namun endapan-endapan pemikiran seorang penyair merupakan suatu karya yang penghargaannya diberikan lantaran merupakan bentuk baru dalam menciptakan sebuah sudut pandang.',
    4.9, 
    8900, 
    'assets/Jalan-Keempat.jpg',
    'Diva Press', 
    2019, 
    68, 
    '978-602-391-814-0',
    '14 X 20 cm',
  ),
];

final List<Book> pilihanTerbaruBooks = [
  Book(
    'Jalan Udara', 
    'Boris Pasternak', 
    'Thriller', 
    'Dalam Jalan Udara, Pasternak menunjukkan secara mendalam tata bahasa puitis modern. Tema takdir manusia dalam revolusi terungkap melalui antitesis spasial antara dunia alam abadi dan dunia sejarah. Melalui pola spasial detail gambar, penjajaran mode naratif, dan pengenalan waktu historis, pembaca akan memahami drama manusia yang kompleks dihadirkan dengan baik dalam cerita.',
    4.7, 
    2500, 
    'assets/Jalan-Udara.jpg',
    'Basabasi', 
    2019, 
    152, 
    '978-623-7290-37-7',
    '14 X 20 cm',
  ),
  Book(
    'Kita Kata Cinta', 
    'Khrisna Pabichara', 
    'Sejarah', 
    'Kita, Kata, dan Cinta dapat berlaku sebagai buku pelajaran bahasa Indonesia yang mengembangkan kalimat demi kalimat sampai menjadi sebuah novel, dengan bahasa Indonesia yang tidak sekadar diterapkan sebetul mungkin, tetapi juga menjadi subjek maupun objek novel ini sendiri.',
    4.3, 
    710, 
    'assets/Kita-Kata-Cinta.jpg',
    'Diva Press', 
    2019, 
    440, 
    '978-602-391-694-8',
    '15 X 24 cm',
  ),
  Book(
    'Perempuan-Batih', 
    'A.R. Rizal', 
    'Horor', 
    'Gadis, seorang perempuan kampung yang hidup dalam masyarakat matrilineal Minangkabau, Sumatra Barat. Sebagai anak perempuan satu-satunya, seharusnya kehidupan Gadis baik-baik saja. Tapi tidak. Ia justru harus menantang hidup yang sangat berat. Menjawab tantangan kehidupan akan takdirnya sebagai perempuan.',
    3.9, 
    1800, 
    'assets/Perempuan-Batih.jpg',
    'Laksana', 
    2018, 
    260, 
    '978-602-407-405-0',
    '14 X 20 cm',
  ),
  Book(
    'PETUALANGAN DON QUIXOTE', 
    'Miguel De Cervantes', 
    'Sejarah', 
    'berkisah tentang kegilaan Alonzo Quinjano akibat terlalu banyak membaca buku-buku petualangan para kesatria. Gagasan-gagasan kepahlawanan dan kehebatan para kesatria yang ada di buku-buku yang dibaca itu membuat tuan tanah ini terkagum-kagum. Ia memutuskan untuk menjadi kesatria yang membela kebenaran melalui peristiwa-peristiwa yang heroik. ',
    4.3, 
    710, 
    'assets/PETUALANGAN-DON-QUIXOTE.jpg',
    ' Immortal Publisher', 
    2017, 
    124, 
    '978-602-6657-62-6',
    '13 X 19 cm',
  ),
  Book(
    'Romeo Juliet', 
    'William Shakespeare', 
    'Fiksi', 
    'Sebuah tinjauan kronologis yang komprehensif tentang Peradaban Lembah Sungai Indus, termasuk penemuan artefak dan misteri runtuhnya peradaban tersebut.',
    4.3, 
    710, 
    'assets/Romeo-Juliet.jpg',
    'Buku Bijak', 
    2020, 
    166, 
    '978-623-92430-9-8',
    '13 X 19 cm',
  ),
];

// Gabungkan semua buku untuk keperluan filter kategori/pencarian
final List<Book> allBooks = [...rekomendasiBooks, ...pilihanTerbaruBooks]; 

// --- Data Dummy Pustaka untuk simulasi Tab ---
final List<Book> readingBooks = rekomendasiBooks.sublist(0, 1);
final List<Book> finishedBooks = pilihanTerbaruBooks.sublist(0, 1);
final List<Book> wishlistBooks = allBooks.sublist(1, 3); // Mengambil dari daftar gabungan

// 🏠 LAYAR UTAMA (HOMEPAGE)
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; 
  String _selectedCategory = 'Semua'; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Selalu update index
    });
    
    // Pergi ke rute yang sesuai, kecuali untuk index 0 (HomePage)
    switch (index) {
      case 1:
        Navigator.pushNamed(context, '/community');
        break;
      case 2:
        Navigator.pushNamed(context, '/library');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
      default:
        // Jika index 0, tidak perlu pindah halaman, cukup setState
        break;
    }
  }
  
  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _showAllCategoriesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Genre Lain'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildGenreOption(context, 'Tech'), 
                _buildGenreOption(context, 'Sejarah'),
                _buildGenreOption(context, 'Astronomi'), 
                _buildGenreOption(context, 'Fantasi'),
                _buildGenreOption(context, 'Thriller'),
                _buildGenreOption(context, 'Biografi'),
                _buildGenreOption(context, 'Horor'), 
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGenreOption(BuildContext context, String genre) {
    return ListTile(
      title: Text(genre),
      onTap: () {
        _selectCategory(genre);
        Navigator.pop(context); 
      },
    );
  }

  // NOTE PENTING: Fungsi ini sekarang memfilter daftar input.
  List<Book> _filterBooks(List<Book> books, String category) {
    if (category == 'Semua') {
      return books;
    }
    return books.where((book) => book.genre == category).toList();
  }


  @override
  Widget build(BuildContext context) {
    // 1. Filter diterapkan pada daftar buku masing-masing.
    final filteredRekomendasi = _filterBooks(rekomendasiBooks, _selectedCategory);
    final filteredTerbaru = _filterBooks(pilihanTerbaruBooks, _selectedCategory);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF7F9FC), Color(0xFFF0F5FF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildSearchBar(),
                const SizedBox(height: 30),
                _buildCategorySection(context),
                const SizedBox(height: 20),
                // 2. Menggunakan daftar yang sudah difilter: filteredRekomendasi
                _buildBookSection('Buku Rekomendasi', filteredRekomendasi),
                const SizedBox(height: 30),
                // 3. Menggunakan daftar yang sudah difilter: filteredTerbaru
                _buildBookSection('Pilihan Terbaru', filteredTerbaru), 
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
  
  Widget _buildHeader() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xFFE3F2FD),
          child: Icon(Icons.person, color: Color.fromARGB(255, 29, 248, 21), size: 30),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              'Muhammad Yusman',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), 
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Cari buku, penulis, atau genre...',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: Icon(Icons.apps, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context) {
    final List<String> categories = ['Semua', 'Fiksi', 'Non-Fiksi', 'Novel'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kategori',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded( 
              child: SingleChildScrollView( 
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...categories.map((cat) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ActionChip( 
                        label: Text(
                          cat,
                          style: TextStyle(
                            color: _selectedCategory == cat ? Colors.white : Colors.black87,
                          ),
                        ),
                        backgroundColor: _selectedCategory == cat ? const Color.fromARGB(255, 50, 252, 32) : const Color(0xFFE0E0E0),
                        onPressed: () => _selectCategory(cat), 
                      ),
                    )).toList(),
                  ],
                ),
              ),
            ),
            
            TextButton(
              onPressed: () => _showAllCategoriesDialog(context), 
              child: const Text('Lihat Semua', style: TextStyle(color: Color(0xFF2196F3))),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBookSection(String title, List<Book> books) {
    // Tambahkan kondisi untuk menampilkan jika daftar buku tidak kosong
    if (books.isEmpty && _selectedCategory != 'Semua') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Center(child: Text('Tidak ada buku $title dalam kategori "$_selectedCategory".', style: const TextStyle(color: Colors.grey))),
        ],
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal, 
            itemCount: books.length,
            itemBuilder: (context, index) {
              return _buildBookItem(context, books[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookItem(BuildContext context, Book book) {
    return GestureDetector( 
      onTap: () {
        Navigator.pushNamed(context, '/book-detail', arguments: book);
      },
      child: Container(
        width: 120, 
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      book.imagePath, 
                      fit: BoxFit.cover,
                      width: double.infinity,
                      // Placeholder jika gambar tidak ada (penting untuk robust app)
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFFBBDEFB),
                        alignment: Alignment.center,
                        child: const Icon(Icons.book, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      print('Tambahkan ${book.title} ke favorit!');
                    },
                    child: const Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              book.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              book.author,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        // KOMUNITAS
        BottomNavigationBarItem(
          icon: Icon(Icons.people), 
          label: 'Komunitas',
        ),
        // PUSTAKA
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Pustaka',
        ),
        // PROFIL
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 58, 243, 33),
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}

// 📚 LAYAR DETAIL BUKU (DIPERBARUI DENGAN ISBN & UKURAN)
class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  Widget _buildRatingStar(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(const Icon(Icons.star, color: Colors.amber, size: 20));
      } else if (i == fullStars && hasHalfStar) {
        stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 20));
      } else {
        stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 20));
      }
    }
    return Row(children: stars);
  }
  
  // Widget untuk menampilkan baris detail spesifik
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 20),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET BARU: Collapsible Sinopsis ---
  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)?.settings.arguments as Book?;

    if (book == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Buku'), backgroundColor: const Color(0xFF2196F3)),
        body: const Center(child: Text('Data buku tidak ditemukan.')),
      );
    }

    String formattedReviewCount;
    if (book.reviewCount >= 1000) {
      formattedReviewCount = '${(book.reviewCount / 1000).toStringAsFixed(1)}K';
    } else {
      formattedReviewCount = book.reviewCount.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title, style: const TextStyle(fontSize: 18)),
        backgroundColor: const Color.fromARGB(255, 75, 243, 33),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              print('Tambahkan ${book.title} ke favorit!');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect( 
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      book.imagePath, 
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFFBBDEFB),
                        alignment: Alignment.center,
                        child: const Icon(Icons.book, size: 50, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Oleh ${book.author}',
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 15),
                      
                      Row(
                        children: [
                          _buildRatingStar(book.rating),
                          const SizedBox(width: 8),
                          Text(
                            book.rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(' / 5'),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '(${formattedReviewCount} Ulasan Pengguna)',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 15),
                      Chip(
                        label: Text(book.genre),
                        backgroundColor: const Color(0xFFE3F2FD),
                        labelStyle: const TextStyle(color: Color.fromARGB(255, 82, 243, 33)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 40),
            
            // SINOPIS (Implementasi Collapsible di sini)
            const Text(
              'Sinopsis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _CollapsibleText(text: book.description), // WIDGET BARU
            const SizedBox(height: 40),
            
            // DETAIL BUKU
            const Text(
              'Detail Buku',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildDetailRow(Icons.person_outline, 'Penulis', book.author), 
            _buildDetailRow(Icons.business, 'Penerbit', book.publisher),
            _buildDetailRow(Icons.vpn_key_sharp, 'ISBN', book.isbn), 
            _buildDetailRow(Icons.calendar_today, 'Tahun', book.publicationYear.toString()), 
            _buildDetailRow(Icons.straighten, 'Ukuran', book.size), 
            _buildDetailRow(Icons.description, 'Halaman', '${book.pageCount} halaman'), 
            const Divider(),
            const SizedBox(height: 20),
            
            // TOMBOL AKSI UTAMA
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  print('Mulai Baca ${book.title}');
                },
                icon: const Icon(Icons.book),
                label: const Text('Mulai Baca', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 82, 243, 33),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  print('Lihat Ulasan untuk ${book.title}');
                },
                icon: const Icon(Icons.comment, color: Color.fromARGB(255, 75, 243, 33)),
                label: const Text('Lihat Semua Ulasan', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 68, 243, 33))),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(color: Color.fromARGB(255, 68, 243, 33)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET BARU: Untuk Sinopsis yang Dapat Dilipat (Collapsible) ---
class _CollapsibleText extends StatefulWidget {
  final String text;
  final int maxLines;

  // ignore: unused_element_parameter
  const _CollapsibleText({required this.text, this.maxLines = 4});

  @override
  State<_CollapsibleText> createState() => __CollapsibleTextState();
}

class __CollapsibleTextState extends State<_CollapsibleText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Gunakan LayoutBuilder untuk mendapatkan tinggi teks
    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(
          text: widget.text,
          style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black),
        );

        final textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.justify,
        )..layout(maxWidth: constraints.maxWidth);

        // Cek apakah teks benar-benar melebihi batas baris
        final isTextClipped = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.text,
              style: const TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
              maxLines: _isExpanded ? null : widget.maxLines,
              overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            
            if (isTextClipped || _isExpanded) // Tampilkan tombol hanya jika teks panjang atau sudah diperluas
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _isExpanded ? 'Sembunyikan' : 'Lihat Selengkapnya',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 40, 243, 33),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

// 📚 LAYAR PUSTAKA SAYA 
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pustaka Saya'),
          backgroundColor: const Color.fromARGB(255, 58, 243, 33),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xAAFFFFFF),
            tabs: [
              Tab(text: 'Sedang Dibaca', icon: Icon(Icons.schedule)),
              Tab(text: 'Selesai Dibaca', icon: Icon(Icons.check_circle_outline)),
              Tab(text: 'Daftar Keinginan', icon: Icon(Icons.bookmark_border)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookList(context, readingBooks),
            _buildBookList(context, finishedBooks),
            _buildBookList(context, wishlistBooks),
          ],
        ),
      ),
    );
  }

  Widget _buildBookList(BuildContext context, List<Book> books) {
    if (books.isEmpty) {
      return const Center(
        child: Text('Belum ada buku dalam kategori ini.', style: TextStyle(color: Colors.grey)),
      );
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  book.imagePath, 
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: const Color(0xFFBBDEFB),
                    alignment: Alignment.center,
                    child: const Icon(Icons.book, color: Colors.blueGrey),
                  ),
                ),
              ),
            ),
            title: Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(book.author),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, '/book-detail', arguments: book);
            },
          ),
        );
      },
    );
  }
}

// 👤 LAYAR PROFIL PENGGUNA 
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: const Color.fromARGB(255, 40, 243, 33),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFFE3F2FD),
              child: Icon(Icons.person_outline, size: 70, color: Color(0xFF2196F3)),
            ),
            const SizedBox(height: 10),
            const Text(
              'Muhammad Yusman Bayuga',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'yusmanbayuga13@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Buku Dibaca', '15'),
                _buildStatItem('Ulasan', '42'),
                _buildStatItem('Favorit', '28'),
              ],
            ),
            const Divider(height: 40),

            _buildProfileMenuItem(context, Icons.settings, 'Pengaturan Akun'),
            _buildProfileMenuItem(context, Icons.history, 'Riwayat Bacaan'),
            _buildProfileMenuItem(context, Icons.bookmark_border, 'Daftar Keinginan'),
            _buildProfileMenuItem(context, Icons.help_outline, 'Bantuan & Dukungan'),

            const SizedBox(height: 30),
            
            ElevatedButton.icon(
              onPressed: () {
                print('Logout ditekan');
              },
              icon: const Icon(Icons.logout),
              label: const Text('Keluar (Logout)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2196F3)),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildProfileMenuItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 40, 243, 33)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        print('$title diklik');
      },
    );
  }
}

// 👥 LAYAR KOMUNITAS 
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Komunitas Baca'),
        backgroundColor: const Color.fromARGB(255, 33, 243, 33),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildCommunityCard('Grup Diskusi: Fiksi Ilmiah', 'Sedang membahas DUNE. Bergabunglah!'),
          _buildCommunityCard('Postingan Terbaru', 'Apakah buku ini layak dibaca? (Oleh Pengguna X)'),
          const Divider(),
          Center(
            child: Text(
              'Jelajahi Grup Bacaan Lain',
              style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityCard(String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.forum, color: Color.fromARGB(255, 58, 243, 33)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          print('$title diklik');
        },
      ),
    );
  }
}

// --------------------------------------------------------------------------
// --- MAIN APP ---
// --------------------------------------------------------------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Buku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', 
      ),
      // --- PERUBAHAN UTAMA ---
      // Mengatur '/login' sebagai rute awal agar pengguna wajib login dahulu.
      initialRoute: '/login', 
      routes: {
        // Rute utama aplikasi (setelah login berhasil)
        '/': (context) => const HomePage(), 
        // Rute Otentikasi
        '/login': (context) => const LoginScreen(), 
        '/register': (context) => const RegisterScreen(), // Ditambahkan

        // Rute Fungsionalitas Aplikasi
        '/book-detail': (context) => const BookDetailScreen(),
        '/profile': (context) => const ProfileScreen(), 
        '/community': (context) => const CommunityScreen(), 
        '/library': (context) => const LibraryScreen(), 
      },
    );
  }
}