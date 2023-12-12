// Import paket-paket yang diperlukan
import 'package:fitfind/model/api_response.dart';
import 'package:fitfind/model/user.dart';
import 'package:fitfind/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitfind/view/appbar/app_name.dart';
import 'package:fitfind/constant.dart';
import 'package:fitfind/view/init_screen/login/login.dart';
import 'package:google_fonts/google_fonts.dart';

// Widget untuk menampilkan layar pendaftaran
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      passwordConfirmController = TextEditingController();

  // Fungsi untuk mendaftarkan pengguna
  void _registerUser() async {
    ApiResponse response = await register(
        nameController.text, emailController.text, passwordController.text);
    if (response.error == null) {
      _saveAndRedirectToLogin(response.data as User);
    } else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Fungsi untuk menyimpan token pengguna dan pindah ke layar login
  void _saveAndRedirectToLogin(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
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
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          children: [
            SizedBox(
                height: 20), // Tambahkan ruang antara gambar dan bidang teks

            // Teks "Login" menjadi tebal dan berada di tengah
            Text(
              'Sign Up',
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
              'Please fill in the following fields.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // Input field untuk nama
            TextFormField(
                controller: nameController,
                validator: (val) => val!.isEmpty ? 'Invalid name' : null,
                decoration: kInputDecoration('Name')),
            SizedBox(
              height: 20,
            ),

            // Input field untuk alamat email
            TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (val) =>
                    val!.isEmpty ? 'Invalid email address' : null,
                decoration: kInputDecoration('Email')),
            SizedBox(
              height: 20,
            ),

            // Input field untuk kata sandi
            TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (val) =>
                    val!.length < 6 ? 'Required at least 6 chars' : null,
                decoration: kInputDecoration('Password')),
            SizedBox(
              height: 20,
            ),

            // Input field untuk konfirmasi kata sandi
            TextFormField(
                controller: passwordConfirmController,
                obscureText: true,
                validator: (val) => val != passwordController.text
                    ? 'Confirm password does not match'
                    : null,
                decoration: kInputDecoration('Confirm password')),
            SizedBox(
              height: 20,
            ),

            // Tombol pendaftaran
            loading
                ? Center(child: CircularProgressIndicator())
                : kTextButton(
                    'Sing Up',
                    () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loading = !loading;
                          _registerUser();
                        });
                      }
                    },
                  ),
            SizedBox(
              height: 20,
            ),

            // Pesan untuk pindah ke halaman login
            kLoginRegisterHint('Already have an account? ', 'Login', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false);
            })
          ],
        ),
      ),
    );
  }
}
