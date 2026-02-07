import '../models/product.dart';

final List<Product> products = [
  // MEVCUT ÜRÜNLER
  Product(
    id: 'p1',
    name: 'Fender Stratocaster',
    category: 'Gitar',
    price: 25000.00,
    imagePath: 'assets/images/guitar.png',
    description: 'Efsanevi Fender tonu. Rock tarihini değiştiren gitar. Kristal netliğinde tizler ve dolgun baslar.',
    isFavorite: false,
  ),
  Product(
    id: 'p2',
    name: 'Marshall Stanmore II',
    category: 'Amfi',
    price: 12500.00,
    imagePath: 'assets/images/amp.png',
    description: 'Eviniz için mükemmel, güçlü ses. Bluetooth bağlantısı ile kablosuz özgürlük.',
    isFavorite: false,
  ),
  Product(
    id: 'p3',
    name: 'Boss DS-1 Distortion',
    category: 'Pedal',
    price: 3200.00,
    imagePath: 'assets/images/pedal.png',
    description: 'Dünyanın en çok satan distortion pedalı. Kurt Cobain\'in favorisi.',
    isFavorite: false,
  ),
  Product(
    id: 'p4',
    name: 'Sennheiser HD 600',
    category: 'Kulaklık',
    price: 18000.00,
    imagePath: 'assets/images/headphones.png',
    description: 'Odyofillerin tercihi. Açık kapsül tasarımı ile doğal ve şeffaf ses.',
    isFavorite: false,
  ),
  Product(
    id: 'p5',
    name: 'Yamaha Rydeen',
    category: 'Davul',
    price: 35000.00,
    imagePath: 'assets/images/drum.png',
    description: 'Başlangıç ve orta seviye için ideal akustik davul seti. Dayanıklı aksam.',
    isFavorite: false,
  ),

  // --- YENİ EKLENENLER ---
  
  Product(
    id: 'p6',
    name: 'Gibson Les Paul',
    category: 'Gitar',
    price: 85000.00,
    imagePath: 'assets/images/guitar2.png', // Yeni resim 1
    description: 'Sıcak ve dolgun humbucker tonları. Slash ve Jimmy Page\'in efsanevi tercihi.',
    isFavorite: false,
  ),
  Product(
    id: 'p7',
    name: 'Ibanez RG550',
    category: 'Gitar',
    price: 42000.00,
    imagePath: 'assets/images/guitar3.png', // Yeni resim 2
    description: 'Hız tutkunları için ince sap yapısı ve yüksek çıkışlı manyetikler. Metal müzik için birebir.',
    isFavorite: false,
  ),
  Product(
    id: 'p8',
    name: 'Pearl Export EXX',
    category: 'Davul',
    price: 48000.00,
    imagePath: 'assets/images/drum2.png', // Yeni resim 3
    description: 'Dünyanın en çok satan davul seti. Sahne performansları için güçlü ve net tonlar.',
    isFavorite: false,
  ),
];