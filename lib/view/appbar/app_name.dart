// Import paket yang diperlukan
import 'package:fitfind/imports.dart'; // Berkas berisi impor paket dan konfigurasi aplikasi

// Widget untuk menampilkan nama aplikasi "FitFind"
class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Baris widget yang menampilkan teks "Fit" dan "Find" dengan warna dan ukuran yang sesuai
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextBuilder(
        text: 'Fit',
        color: Constraints.APP_BAR_HOME_TEXT1_COLOR,
        fontSize: 30.0,
      ),
      TextBuilder(
        text: 'Find',
        color: Constraints.APP_BAR_HOME_TEXT2_COLOR,
        fontSize: 30.0,
      ),
    ]);
  }
}
