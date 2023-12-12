// Import file dengan kumpulan package atau modul yang diperlukan
import 'package:fitfind/imports.dart';

// Widget untuk membangun teks dengan berbagai properti gaya dan penataan
class TextBuilder extends StatelessWidget {
  // Teks yang akan ditampilkan
  final String? text;

  // Ukuran teks
  final double? fontSize;

  // Warna teks
  final Color? color;

  // Gaya cetak teks (misalnya, bold, normal)
  final FontWeight? fontWeight;

  // Spasi antar karakter dalam teks
  final double? latterSpacing;

  // Jenis overflow ketika teks melebihi batas maksimum baris
  final TextOverflow? textOverflow;

  // Jumlah maksimum baris yang akan ditampilkan
  final int? maxLines;

  // Penataan teks dalam widget
  final TextAlign? textAlign;

  // Ketinggian teks
  final double? height;

  // Spasi antar kata dalam teks
  final double? wordSpacing;

  // Dekorasi teks (misalnya, garis bawah, garis atas)
  final TextDecoration? textDecoration;

  // Gaya tulisan teks (misalnya, miring, normal)
  final FontStyle? fontStyle;

  // Konstruktor untuk menginisialisasi properti teks
  const TextBuilder({
    Key? key,
    this.text,
    this.fontSize,
    this.color,
    this.textOverflow,
    this.fontWeight,
    this.latterSpacing,
    this.maxLines,
    this.textAlign,
    this.height,
    this.wordSpacing,
    this.textDecoration,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menggunakan widget Text dengan gaya teks dari Google Fonts
    return Text(
      text!, // Menampilkan teks yang diberikan
      style: GoogleFonts.lato(
        fontSize: fontSize, // Menetapkan ukuran teks
        color: color, // Menetapkan warna teks
        fontWeight: fontWeight, // Menetapkan gaya cetak teks
        letterSpacing: latterSpacing, // Menetapkan spasi antar karakter
        height: height, // Menetapkan ketinggian teks
        wordSpacing: wordSpacing, // Menetapkan spasi antar kata
        decoration: textDecoration, // Menetapkan dekorasi teks
        fontStyle: fontStyle, // Menetapkan gaya tulisan teks
      ),
      maxLines: maxLines, // Menetapkan jumlah maksimum baris
      overflow: textOverflow, // Menetapkan jenis overflow
      textAlign: textAlign, // Menetapkan penataan teks
    );
  }
}
