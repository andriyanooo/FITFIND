// Import paket-paket yang diperlukan
import 'dart:convert'; // Paket untuk mengelola konversi JSON
import 'package:fitfind/constant.dart'; // Berkas berisi konstanta-konstanta aplikasi
import 'package:fitfind/model/api_response.dart'; // Model untuk respons API
import 'package:fitfind/model/user.dart'; // Model untuk data pengguna
import 'package:http/http.dart' as http; // Paket untuk panggilan HTTP

// Fungsi untuk melakukan login
Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiResponse =
      ApiResponse(); // Objek untuk menyimpan hasil respons API
  try {
    // Panggilan HTTP POST ke endpoint login dengan mengirimkan email dan password
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});

    // Periksa kode status respons
    switch (response.statusCode) {
      case 200:
        // Jika berhasil (status 200), konversi data JSON ke objek User
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        // Jika terjadi kesalahan validasi (status 422), ambil pesan kesalahan dari server
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        // Jika terjadi kesalahan otentikasi (status 403), ambil pesan kesalahan dari server
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        // Jika terjadi kesalahan lainnya, set pesan kesalahan umum
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    // Jika terjadi kesalahan pada koneksi atau server, set pesan kesalahan server
    apiResponse.error = serverError;
  }

  return apiResponse; // Kembalikan objek ApiResponse
}

// Fungsi untuk melakukan registrasi
Future<ApiResponse> register(String name, String email, String password) async {
  ApiResponse apiResponse =
      ApiResponse(); // Objek untuk menyimpan hasil respons API
  try {
    // Panggilan HTTP POST ke endpoint registrasi dengan mengirimkan data registrasi
    final response = await http.post(Uri.parse(registerURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password
    });

    // Periksa kode status respons
    switch (response.statusCode) {
      case 200:
        // Jika berhasil (status 200), konversi data JSON ke objek User
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        // Jika terjadi kesalahan validasi (status 422), ambil pesan kesalahan dari server
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        // Jika terjadi kesalahan lainnya, set pesan kesalahan umum
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    // Jika terjadi kesalahan pada koneksi atau server, set pesan kesalahan server
    apiResponse.error = serverError;
  }
  return apiResponse; // Kembalikan objek ApiResponse
}


/*// User
Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(
      Uri.parse(userURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });

    switch(response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } 
  catch(e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// Update user
Future<ApiResponse> updateUser(String name, String? image) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.put(
      Uri.parse(userURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }, 
      body: image == null ? {
        'name': name,
      } : {
        'name': name,
        'image': image
      });
      // user can update his/her name or name and image

    switch(response.statusCode) {
      case 200:
        apiResponse.data =jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        print(response.body);
        apiResponse.error = somethingWentWrong;
        break;
    }
  }
  catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// get token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

// get user id
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

// logout
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

// Get base64 encoded image
String? getStringImage(File? file) {
  if (file == null) return null ;
  return base64Encode(file.readAsBytesSync());
}*/