import 'package:flutter/material.dart';
import '../models/cart.dart'; // Sepeti temizlemek için lazım

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // FORM ANAHTARI: Bu anahtar sayesinde formun durumunu kontrol edeceğiz.
  // Kullanıcı "Kaydet"e basınca tüm kutucukları tek tek gezip "Hata var mı?" diye soracak.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Ödeme Ekranı 💳'),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView( // Klavye açılınca ekran kayabilsin diye
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey, // Anahtarı buraya taktık
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- BAŞLIK: ADRES BİLGİLERİ ---
              const Text("Teslimat Adresi", style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // 1. İSİM SOYİSİM
              _buildTextField(
                label: "Ad Soyad",
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Lütfen adınızı girin";
                  if (value.length < 3) return "İsim çok kısa";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // 2. ADRES
              _buildTextField(
                label: "Açık Adres",
                icon: Icons.location_on,
                maxLines: 3, // Geniş kutu
                validator: (value) {
                  if (value == null || value.isEmpty) return "Adres boş bırakılamaz";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // 3. TELEFON
              _buildTextField(
                label: "Telefon Numarası",
                icon: Icons.phone,
                inputType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Telefon gerekli";
                  if (!value.startsWith("0")) return "0 ile başlamalı";
                  return null;
                },
              ),

              const SizedBox(height: 30),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),

              // --- BAŞLIK: KART BİLGİLERİ ---
              const Text("Ödeme Yöntemi", style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // 4. KART NUMARASI
              _buildTextField(
                label: "Kart Numarası",
                icon: Icons.credit_card,
                inputType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Kart numarası girin";
                  if (value.length < 16) return "16 haneli olmalı";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // 5. SON KULLANMA VE CVV (Yanyana)
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: "Ay/Yıl (MM/YY)",
                      icon: Icons.calendar_today,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Tarih girin";
                        if (!value.contains("/")) return "Örn: 10/26";
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildTextField(
                      label: "CVV",
                      icon: Icons.lock,
                      inputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "CVV girin";
                        if (value.length != 3) return "3 hane olmalı";
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // SİPARİŞİ TAMAMLA BUTONU
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    // FORM KONTROL ANI!
                    if (_formKey.currentState!.validate()) {
                      // Hata yoksa burası çalışır
                      _showSuccessDialog();
                    } else {
                      // Hata varsa alanlar kırmızı yanar, işlem yapma
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Lütfen hatalı alanları düzeltin"), backgroundColor: Colors.red),
                      );
                    }
                  },
                  child: const Text(
                    "Ödemeyi Onayla ve Bitir ✅",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // YARDIMCI METOD: Tekrar tekrar aynı kodu yazmamak için kutucuk üreten fonksiyon
  Widget _buildTextField({
    required String label,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      keyboardType: inputType,
      maxLines: maxLines,
      validator: validator, // Doğrulama kuralı buraya geliyor
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: Icon(icon, color: Colors.amber[700]),
        filled: true,
        fillColor: Colors.grey[900],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[800]!),
        ),
        focusedBorder: OutlineInputBorder( // Tıklayınca parlasın
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.amber),
        ),
        errorBorder: OutlineInputBorder( // Hata varsa kırmızı olsun
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  // BAŞARI PENCERESİ (POP-UP)
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Boşluğa basınca kapanmasın
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Icon(Icons.check_circle, color: Colors.green, size: 60),
        content: const Text(
          "Siparişiniz Başarıyla Alındı!\n\nKargoya verildiğinde sizi bilgilendireceğiz.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            child: const Text("Ana Sayfaya Dön", style: TextStyle(color: Colors.amber, fontSize: 16)),
            onPressed: () {
              // 1. Sepeti Temizle
              Cart().clear();
              // 2. Pop-up'ı kapat
              Navigator.of(ctx).pop(); 
              // 3. Ana sayfaya kadar her şeyi kapat (En başa dön)
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}