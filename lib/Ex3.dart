import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             ProductCard(product: Product.dart),
            SizedBox(height: 20),
            ProductCard(product: Product.flutter),
            SizedBox(height: 20),
            ProductCard(product: Product.firebase),
          ],
        ),
      ),
    ),
  ));
}
enum Product {
  dart(
    "Dart",
    "The best programming language.",
    "assets/dart.png",
  ),

  flutter(
    "Flutter",
    "The best mobile widget library.",
    "assets/flutter.png",
  ),

  firebase(
    "Firebase",
    "The best cloud database.",
    "assets/firebase.png",
  );

  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);
}
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              product.description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
