import 'product.dart';

class CartItem {
  final Product product;
  int quantity; // Adet bilgisi (Değişebilir)

  CartItem({
    required this.product,
    this.quantity = 1, // Varsayılan adet 1
  });
}