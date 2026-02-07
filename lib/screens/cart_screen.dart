import 'package:flutter/material.dart';
import '../models/cart.dart';
import 'checkout_screen.dart'; // YENİ: Ödeme ekranını içeri aldık

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Cart();

    return Scaffold(
      backgroundColor: Colors.black, // SoundStation Teması
      appBar: AppBar(
        title: const Text('Sepetim 🛒'),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[800]),
                  const SizedBox(height: 20),
                  const Text(
                    "Sepetin bomboş...",
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                // 1. ÜRÜN LİSTESİ
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, index) {
                      final cartItem = cart.items[index];
                      return Card(
                        color: Colors.grey[900],
                        margin: const EdgeInsets.only(bottom: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              // Resim
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(cartItem.product.imagePath, fit: BoxFit.contain),
                              ),
                              const SizedBox(width: 15),
                              
                              // Bilgiler
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cartItem.product.name,
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                    const SizedBox(height: 5),
                                    Text('₺${cartItem.product.price.toStringAsFixed(2)}',
                                        style: TextStyle(color: Colors.amber[400], fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),

                              // Artır / Azalt Butonları
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
                                    onPressed: () {
                                      setState(() {
                                        cart.removeSingleItem(cartItem.product);
                                      });
                                    },
                                  ),
                                  Text(
                                    '${cartItem.quantity}',
                                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline, color: Colors.greenAccent),
                                    onPressed: () {
                                      setState(() {
                                        cart.addToCart(cartItem.product);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // 2. ALT TOPLAM ve ÖDEMEYE GEÇ BUTONU
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                    boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10, offset: const Offset(0, -5))],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Toplam Tutar:", style: TextStyle(color: Colors.white70, fontSize: 18)),
                          Text(
                            "₺${cart.totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(color: Colors.amber[400], fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      // İŞTE GÜNCELLENEN BUTON BURADA:
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber[700],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: () {
                            // Sadece navigasyon yapıyoruz.
                            // Sepet temizleme işlemini ödeme başarılı olunca yapacağız.
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                            );
                          },
                          child: const Text(
                            "Ödemeye Geç 💳",
                            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}