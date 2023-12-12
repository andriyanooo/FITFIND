/*import 'package:fitfind/model/api_response.dart';
import 'package:fitfind/model/user.dart';
import 'package:fitfind/services/user_service.dart';
import 'package:fitfind/view/home/Home_screens.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitfind/constant.dart';
import 'package:fitfind/view/init_screen/register/register.dart';
import 'package:fitfind/view/appbar/app_name.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: AppName(),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            // Add an image at the top of the login screen
            /*Image.asset(
              'images/i.png', // Replace with your image path
              height: 100,
            ),*/

            // Make "Login" text left-aligned, bold, and with a larger font size
            Text(
              'Login',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 30, // Increase font size for better visibility
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set your desired text color
                ),
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              'Please Login to continue.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),

            SizedBox(height: 20),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: txtEmail,
              validator: (val) => val!.isEmpty ? 'Invalid email address' : null,
              decoration: kInputDecoration('Email'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: txtPassword,
              obscureText: true,
              validator: (val) =>
                  val!.length < 6 ? 'Required at least 6 chars' : null,
              decoration: kInputDecoration('Password'),
            ),
            SizedBox(height: 20),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                          _loginUser();
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set your desired button color
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
            SizedBox(height: 10),
            kLoginRegisterHint('Don\'t have an account? ', 'Sign Up', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Register()),
                  (route) => false);
            }),
          ],
        ),
      ),
    );
  }
}
*/

// Import paket-paket yang diperlukan
import 'package:fitfind/model/api_response.dart';
import 'package:fitfind/model/user.dart';
import 'package:fitfind/services/user_service.dart';
import 'package:fitfind/view/home/Home_screens.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitfind/constant.dart';
import 'package:fitfind/view/init_screen/register/register.dart';
import 'package:fitfind/view/appbar/app_name.dart';
import 'package:google_fonts/google_fonts.dart';

// Widget untuk menampilkan layar login
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  // Fungsi untuk melakukan login pengguna
  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Fungsi untuk menyimpan token pengguna dan pindah ke layar utama (HomeScreen)
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: AppName(),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            // Tambahkan gambar di bagian atas layar login
            /*Image.asset(
              'images/i.png', // Ganti dengan path gambar yang diinginkan
              height: 100,
            ),*/

            // Teks "Login" menjadi rata kiri, tebal, dan dengan ukuran font yang lebih besar
            Text(
              'Login',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize:
                      30, // Tingkatkan ukuran font untuk keterlihatan yang lebih baik
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Atur warna teks sesuai keinginan
                ),
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              'Please Login to continue.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),

            SizedBox(height: 20),

            // Input field untuk alamat email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: txtEmail,
              validator: (val) => val!.isEmpty ? 'Invalid email address' : null,
              decoration: kInputDecoration('Email'),
            ),
            SizedBox(height: 10),

            // Input field untuk kata sandi
            TextFormField(
              controller: txtPassword,
              obscureText: true,
              validator: (val) =>
                  val!.length < 6 ? 'Required at least 6 chars' : null,
              decoration: kInputDecoration('Password'),
            ),
            SizedBox(height: 20),

            // Tombol login
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                          _loginUser();
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.blue, // Atur warna tombol sesuai keinginan
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
            SizedBox(height: 10),

            // Pesan untuk pindah ke halaman pendaftaran (Register)
            kLoginRegisterHint('Don\'t have an account? ', 'Sign Up', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Register()),
                  (route) => false);
            }),
          ],
        ),
      ),
    );
  }
}
