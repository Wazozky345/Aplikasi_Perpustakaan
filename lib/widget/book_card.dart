import 'package:apk_perpus/main.dart';
import 'package:flutter/material.dart';


class BookCard extends StatefulWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard>
    with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward(); // mulai animasi fade & scale saat widget muncul
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,   // animasi fade-in
      child: ScaleTransition(
        scale: _scaleAnimation,  // animasi scale-in
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/book-detail',
                arguments: widget.book);
          },
          onTapDown: (_) => _controller.reverse(), // mengecil saat ditekan
          onTapUp: (_) => _controller.forward(),   // kembali membesar
          onTapCancel: () => _controller.forward(),
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
                          widget.book.imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: const Color(0xFFBBDEFB),
                            alignment: Alignment.center,
                            child: const Icon(Icons.book,
                                color: Colors.blueGrey),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          debugPrint(
                              'Tambahkan ${widget.book.title} ke favorit!');
                        },
                        child: const Icon(Icons.favorite_border,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Text(
                  widget.book.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

                Text(
                  widget.book.author,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}