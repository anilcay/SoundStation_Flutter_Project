import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart.dart'; // Sepeti çağırdık

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
                widget.product.isFavorite = isFavorite;
              });
              
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFavorite ? 'Favorilere eklendi! ❤️' : 'Favorilerden çıkarıldı.'),
                  duration: const Duration(milliseconds: 800),
                  backgroundColor: Colors.grey[900],
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Resim Alanı
          Expanded(
            flex: 2,
            child: Center(
              child: Hero(
                tag: widget.product.id,
                child: Image.asset(
                  widget.product.imagePath,
                  fit: BoxFit.contain,
                  height: 300,
                ),
              ),
            ),
          ),
          
          // Detay Paneli
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('₺${widget.product.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 22, color: Colors.amber[400], fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(10)),
                        child: Text(widget.product.category, style: const TextStyle(color: Colors.white70)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("Ürün Açıklaması", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(widget.product.description, style: const TextStyle(color: Colors.grey, fontSize: 16, height: 1.5)),
                    ),
                  ),
                  
                  // SEPETE EKLEME BUTONU (DÜZELTİLEN KISIM)
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[700],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () {
                        // BURASI DEĞİŞTİ: addItem -> addToCart
                        Cart().addToCart(widget.product);
                        
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${widget.product.name} sepete eklendi! 🛒", style: const TextStyle(fontWeight: FontWeight.bold)),
                            backgroundColor: Colors.green,
                            duration: const Duration(milliseconds: 800),
                          ),
                        );
                      },
                      child: const Text("Sepete Ekle 🛒", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}