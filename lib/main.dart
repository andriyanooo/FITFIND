// Import package untuk fitur Device Preview dan file imports.dart
import 'package:device_preview/device_preview.dart';
import 'package:fitfind/imports.dart';

// Fungsi main untuk menjalankan aplikasi
Future<void> main() async {
  // Menjalankan aplikasi dengan menggunakan Device Preview jika aplikasi dijalankan di web
  runApp(
    kIsWeb
        ? DevicePreview(
            enabled:
                !kReleaseMode, // Enable Device Preview hanya pada mode pengembangan
            builder: (context) =>
                MyApp(), // Bungkus aplikasi utama dengan Device Preview
          )
        : MyApp(), // Jika bukan web, jalankan aplikasi utama langsung
  );
}

// Kelas MyApp, merupakan root dari aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan MultiProvider untuk manajemen state dengan ChangeNotifierProvider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CartItems())
      ], // Menyediakan state untuk manajemen keranjang belanja
      child: MaterialApp(
        title: 'Fit Find', // Judul aplikasi
        debugShowCheckedModeBanner:
            false, // Menyembunyikan banner debug pada mode pengembangan
        theme: ThemeData(
          scaffoldBackgroundColor:
              Colors.white, // Warna latar belakang scaffold
          appBarTheme: AppBarTheme(
            iconTheme:
                IconThemeData(color: Colors.black), // Warna ikon pada AppBar
          ),
        ),
        home: Splash(), // Tampilan awal aplikasi adalah Splash Screen
      ),
    );
  }
}
