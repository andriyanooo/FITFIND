// Import library Flutter untuk mengakses fungsi dan widget Flutter
import 'package:flutter/material.dart';

// Kelas untuk menangani konfigurasi ukuran layar
class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenW; // Lebar layar dalam piksel
  static double? screenH; // Tinggi layar dalam piksel
  static double? blockH; // Ukuran blok horizontal relatif terhadap lebar layar
  static double? blockV; // Ukuran blok vertikal relatif terhadap tinggi layar

  // Metode untuk menginisialisasi konfigurasi ukuran layar
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
  }
}
