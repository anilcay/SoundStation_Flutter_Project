import 'product.dart';
import 'cart_item.dart'; // Yeni oluşturduğumuz dosyayı çağır

class Cart {
  // Singleton (Tekil Örnek)
  static final Cart _instance = Cart._internal();
  factory Cart() => _instance;
  Cart._internal();

  // Artık sadece ürünleri değil, 'Sepet Elemanlarını' tutuyoruz
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Sepetteki TOPLAM ürün sayısı (Adetleri de toplar)
  int get itemCount {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  // Sepetin Toplam Tutarı
  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  // Ekleme Mantığı (Adet kontrolü)
  void addToCart(Product product) {
    // 1. Bu ürün zaten sepette var mı?
    try {
      final existingItem = _items.firstWhere((item) => item.product.id == product.id);
      // Varsa adetini artır
      existingItem.quantity++;
    } catch (e) {
      // Yoksa yeni ekle
      _items.add(CartItem(product: product));
    }
  }

  // Adet Azaltma / Silme Mantığı
  void removeSingleItem(Product product) {
    try {
      final existingItem = _items.firstWhere((item) => item.product.id == product.id);
      if (existingItem.quantity > 1) {
        existingItem.quantity--; // 1'den fazlaysa azalt
      } else {
        _items.remove(existingItem); // 1 taneyse komple sil
      }
    } catch (e) {
      // Hata olursa (ürün yoksa) boşver
    }
  }

  // Ürünü komple sepetten uçur
  void removeCompletely(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
  }

  void clear() {
    _items.clear();
  }
}