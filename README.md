.🎸 SoundStation: Müziğin Ritmini Yakalayan E-Ticaret Deneyimi
SoundStation, müzik ekipmanları satışını simüle eden, Flutter ile geliştirilmiş, yüksek performanslı ve modern bir mobil uygulamadır. Sadece bir ürün kataloğu değil; yaşayan, hesaplayan ve kullanıcıyla etkileşime giren tam kapsamlı bir e-ticaret deneyimidir.

🚀 Proje Hakkında
Bu proje, modern mobil uygulama geliştirme prensipleri (Clean Code, State Management, UI/UX Design) dikkate alınarak geliştirilmiştir. Kullanıcıların ürünleri filtreleyebildiği, detaylı inceleyebildiği, sepete ekleyip dinamik olarak yönetebildiği ve güvenli bir form validasyon sürecinden geçerek sipariş verebildiği uçtan uca bir akış sunar.

🌟 Öne Çıkan Özellikler
🛒 Akıllı Sepet Yönetimi (Singleton Pattern):

Sepet mekanizması, uygulamanın her yerinden erişilebilir tek bir merkezden (Singleton) yönetilir.

Aynı üründen birden fazla eklendiğinde liste uzamaz, sadece adet (quantity) artar.

Toplam tutar anlık olarak hesaplanır.

🛡️ Güvenli Ödeme Formu (Form Validation):

Kullanıcı hatalarını önleyen gelişmiş Regex (Düzenli İfadeler) kontrolleri.

Kredi kartı, telefon ve isim alanlarında anlık doğrulama. Hatalı girişlere geçit yok!

🔍 Reaktif Arama ve Filtreleme:

Arama çubuğuna yazılan her harfte liste anlık olarak güncellenir (Real-time Filtering).

Kategorilere (Gitar, Davul, Amfi vb.) göre dinamik süzme işlemi.

🎨 Görsel Şölen (Hero Animations):

Ürün listesinden detay sayfasına geçişte görsellerin "uçarak" yerleşmesini sağlayan Hero Animasyonları ile pürüzsüz bir kullanıcı deneyimi.

Özel tasarlanmış, gradyan geçişli ürün kartları.

❤️ Favori Sistemi:

Beğenilen ürünleri yerel hafızada tutup listeleyebilme özelliği.

🛠️ Teknik Mimari
Proje geliştirilirken sürdürülebilirlik ve performans ön planda tutulmuştur:

Dil: Dart

Framework: Flutter

State Management: setState ve Callback mekanizmaları ile reaktif veri akışı.

Navigasyon: Navigator.push ve pop yöntemleriyle stack tabanlı sayfa geçişleri.

Widget Yapısı: Kod tekrarını önlemek için parçalanmış, yeniden kullanılabilir (Reusable) Widget mimarisi (ProductItem, CartItem vb.).


💻 Kurulum ve Çalıştırma
Projeyi kendi bilgisayarınızda çalıştırmak için aşağıdaki adımları izleyin:

1. Projeyi Klonlayın Terminali açın ve aşağıdaki komutu yazarak projeyi bilgisayarınıza indirin:

Bash
git clone git remote add origin https://github.com/anilcay/SoundStation_Flutter_Project.git
2. Proje Klasörüne Girin

Bash
cd REPO_ADIN
3. Paketleri Yükleyin Gerekli kütüphaneleri indirmek için:

Bash
flutter pub get
4. Çalıştırın! 🚀 Emülatörünüz açıkken şu komutu verin:

Bash
flutter run
🤝 İletişim
Bu proje, Ahmet Anıl Çay tarafından geliştirilmiştir. Herhangi bir soru veya öneri için benimle iletişime geçebilirsiniz.



