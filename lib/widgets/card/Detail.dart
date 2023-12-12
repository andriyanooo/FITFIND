// Import library Flutter untuk mengakses fungsi dan widget Flutter
import 'package:flutter/material.dart';

// Widget khusus yang menampilkan item Radio List Tile dengan tampilan kustom
class MyRadioListTile<T> extends StatelessWidget {
  // Nilai yang akan diwakili oleh item Radio List Tile ini
  final T value;

  // Nilai yang diwakili oleh grup Radio Button
  final T groupValue;

  // Fungsi yang dipanggil ketika nilai Radio List Tile berubah
  final ValueChanged<T?> onChanged;

  // Teks yang ditampilkan sebagai label atau leading pada Radio List Tile
  final String leading;

  // Konstruktor untuk inisialisasi nilai yang diperlukan
  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    // Widget InkWell digunakan untuk memberikan efek ketika ditekan
    return InkWell(
      // Saat Radio List Tile ditekan, fungsi onChanged dipanggil dengan nilai yang sesuai
      onTap: () => onChanged(value),
      child: Row(
        children: [
          // Memanggil widget yang menampilkan Radio Button dengan tampilan kustom
          _customRadioButton,
        ],
      ),
    );
  }

  // Metode untuk mendapatkan widget Radio Button dengan tampilan kustom
  Widget get _customRadioButton {
    // Menentukan apakah Radio Button ini dipilih atau tidak
    final isSelected = value == groupValue;

    // Mengembalikan widget Container yang menampilkan Radio Button dengan tampilan kustom
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        // Memberikan warna latar belakang sesuai dengan kondisi dipilih atau tidak
        color: isSelected ? Color(0xff0F172A) : Colors.white,

        // Memberikan sudut border atau pinggiran pada Container
        borderRadius: BorderRadius.circular(4),
      ),
      // Menampilkan teks sebagai label atau leading pada Radio Button
      child: Text(
        leading,
        style: TextStyle(
          // Memberikan warna teks sesuai dengan kondisi dipilih atau tidak
          color: isSelected ? Colors.white : Color(0xff0F172A),

          // Menentukan ketebalan atau ketajaman teks
          fontWeight: FontWeight.w400,

          // Menentukan ukuran teks
          fontSize: 16,
        ),
      ),
    );
  }
}
