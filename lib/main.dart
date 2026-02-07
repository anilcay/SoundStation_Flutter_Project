import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoundStation',
      debugShowCheckedModeBanner: false, // Sağ üstteki "Debug" bandını kaldır
      theme: ThemeData(
        // Varsayılan tema ayarları
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const HomeScreen(), // Başlangıç sahnemiz
    );
  }
}