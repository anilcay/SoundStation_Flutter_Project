import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import '../models/cart.dart';
import 'favorites_screen.dart';
import 'cart_screen.dart'; // ÖNEMLİ: Bu satır olmazsa sepet açılmaz!

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> _allProducts = products;
  List<Product> _displayedProducts = [];
  String _selectedCategory = "Tümü";
  final List<String> _categories = ["Tümü", "Gitar", "Amfi", "Pedal", "Kulaklık", "Davul"];

  @override
  void initState() {
    super.initState();
    _displayedProducts = _allProducts;
  }

  void _filterProducts(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == "Tümü") {
        _displayedProducts = _allProducts;
      } else {
        _displayedProducts = _allProducts
            .where((item) => item.category == category)
            .toList();
      }
    });
  }

  void _searchProduct(String query) {
    setState(() {
      final lowerQuery = query.toLowerCase();
      _displayedProducts = _allProducts.where((item) {
        final nameLower = item.name.toLowerCase();
        final catLower = item.category.toLowerCase();
        return nameLower.contains(lowerQuery) || catLower.contains(lowerQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('SoundStation 🎸', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.redAccent),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()),
              );
              setState(() {}); 
            },
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, size: 28),
                onPressed: () async {
                  // Sepet ekranına git ve bekle
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                  setState(() {});
                },
              ),
              if (Cart().itemCount > 0)
                Container(
                  margin: const EdgeInsets.only(top: 5, right: 5),
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${Cart().itemCount}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: _searchProduct,
              decoration: InputDecoration(
                hintText: "Ekipman ara... (Örn: Fender)",
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.search, color: Colors.amber[400]),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _categories.length,
              itemBuilder: (ctx, index) {
                final cat = _categories[index];
                final isSelected = _selectedCategory == cat;
                
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: Colors.amber[700],
                    backgroundColor: Colors.grey[800],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    onSelected: (selected) {
                      if (selected) _filterProducts(cat);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _displayedProducts.isEmpty
                ? const Center(
                    child: Text(
                      "Ürün bulunamadı 😔",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _displayedProducts.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (ctx, index) {
                      return ProductItem(
                        product: _displayedProducts[index],
                        onComeBack: () {
                          setState(() {});
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}