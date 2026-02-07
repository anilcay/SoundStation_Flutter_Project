import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/mock_data.dart'; // Tüm ürünleri buradan çekeceğiz

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    // Tüm ürünler içinden sadece favori olanları süzüyoruz
    final favoriteProducts = products.where((item) => item.isFavorite).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Favorilerim ❤️'),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      body: favoriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey[800]),
                  const SizedBox(height: 20),
                  const Text(
                    "Henüz bir şey beğenmedin.",
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: favoriteProducts.length,
              itemBuilder: (ctx, index) {
                final product = favoriteProducts[index];
                return Card(
                  color: Colors.grey[900],
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: Image.asset(product.imagePath, width: 50), // Küçük resim
                    title: Text(product.name, style: const TextStyle(color: Colors.white)),
                    subtitle: Text(
                      '₺${product.price.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.amber[400]),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        // Favoriden çıkarma işlemi
                        setState(() {
                          product.isFavorite = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(
                            content: Text("Favorilerden çıkarıldı."),
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}