/*import 'package:fitfind/imports.dart';
import 'dart:developer' as dev;

import 'package:fitfind/view/onboarding/onboarding_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    dev.log('Splash Init');
    Future.delayed(Duration(seconds: 2)).then((value) => getData());
  }

  getData() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextBuilder(
              text: 'FIT',
              color: Constraints.APP_BAR_HOME_TEXT1_COLOR,
              fontSize: 30.0,
            ),
            TextBuilder(
              text: 'FIND',
              color: Constraints.APP_BAR_HOME_TEXT2_COLOR,
              fontSize: 30.0,
            ),
          ],
        ),
      ),
    ));
  }
}*/

// Import paket-paket yang diperlukan
import 'package:fitfind/imports.dart';
import 'dart:developer' as dev;

// Import halaman onboarding
import 'package:fitfind/view/onboarding/onboarding_screen.dart';

// Widget untuk menampilkan layar splash
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    dev.log('Splash Init'); // Log pesan inisialisasi
    Future.delayed(Duration(seconds: 2)).then((value) => getData());
  }

  // Fungsi untuk pindah ke halaman onboarding dan menghapus semua halaman sebelumnya
  getData() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextBuilder(
                text: 'FIT',
                color: Constraints.APP_BAR_HOME_TEXT1_COLOR,
                fontSize: 30.0,
              ),
              TextBuilder(
                text: 'FIND',
                color: Constraints.APP_BAR_HOME_TEXT2_COLOR,
                fontSize: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
