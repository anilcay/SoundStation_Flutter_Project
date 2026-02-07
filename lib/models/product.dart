// Veri Modeli: Bir ürünün hangi özelliklere sahip olacağını tanımlar.
class Product {
  final int id;
  final String name;
  final String category; // Filtreleme için kullanacağız (Gitar, Amfi vs.)
  final double price;
  final String imagePath;
  final String description;
  bool isFavorite; // Bu alan değişebilir (mutable) olduğu için 'final' yapmadık.

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imagePath,
    required this.description,
    this.isFavorite = false, // Başlangıçta favori değil
  });
}