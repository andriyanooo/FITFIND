// Kelas model User untuk merepresentasikan informasi pengguna
class User {
  int? id; // ID unik pengguna
  String? name; // Nama pengguna
  String? image; // URL gambar pengguna
  String? email; // Alamat email pengguna
  String? token; // Token pengguna untuk otentikasi

  // Konstruktor untuk kelas User
  User({this.id, this.name, this.image, this.email, this.token});

  // Fungsi konversi dari JSON ke objek User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user']['id'],
        name: json['user']['name'],
        image: json['user']['image'],
        email: json['user']['email'],
        token: json['token']);
  }
}
