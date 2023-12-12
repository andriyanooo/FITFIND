// Import file dengan kumpulan package atau modul yang diperlukan
import 'package:fitfind/imports.dart';

// Widget untuk membangun TextField dengan kustomisasi tertentu
class CustomTextField extends StatelessWidget {
  // Teks yang ditampilkan sebagai label TextField
  final String labelText;

  // Teks yang ditampilkan sebagai petunjuk dalam TextField
  final String? hintText;

  // Ikona yang ditampilkan di bagian awal TextField
  final IconData? prefixIcon;

  // Controller untuk mengendalikan nilai TextField
  final TextEditingController? controller;

  // Konstruktor untuk menginisialisasi properti TextField
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menggunakan widget SizedBox untuk mengatur tinggi TextField
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller, // Menggunakan controller yang diberikan
        keyboardType: TextInputType.emailAddress, // Menetapkan jenis keyboard
        style: GoogleFonts.lato(color: Colors.black), // Menetapkan gaya teks
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon, // Menetapkan ikona di bagian awal TextField
            color: Colors.black,
            size: 25,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText, // Menetapkan label TextField
          hintText: hintText, // Menetapkan petunjuk TextField
          enabledBorder:
              border(), // Menetapkan tampilan batas ketika tidak fokus
          border: border(), // Menetapkan tampilan batas
          focusedErrorBorder:
              border(), // Menetapkan tampilan batas saat terjadi kesalahan
          focusedBorder: border(), // Menetapkan tampilan batas saat fokus
        ),
      ),
    );
  }

  // Fungsi untuk mengembalikan batas kustom
  border() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        style: BorderStyle.solid,
        width: 0.5,
      ),
    );
  }
}
