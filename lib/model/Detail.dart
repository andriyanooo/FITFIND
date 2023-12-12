/*class Article {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Article(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'] == null ? 0.0 : json['price'].toDouble();

    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  var isRedStar;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] == null ? 0.0 : json['rate'].toDouble();
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
*/

// Kelas model Article untuk merepresentasikan informasi artikel
class Article {
  int? id; // ID unik artikel
  String? title; // Judul artikel
  double? price; // Harga artikel
  String? description; // Deskripsi artikel
  String? category; // Kategori artikel
  String? image; // URL gambar artikel
  Rating? rating; // Informasi rating artikel

  // Konstruktor untuk kelas Article
  Article({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  // Metode konversi dari JSON ke objek Article
  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'] == null ? 0.0 : json['price'].toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  // Metode konversi dari objek Article ke JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

// Kelas model Rating untuk merepresentasikan informasi rating artikel
class Rating {
  double? rate; // Nilai rating
  int? count; // Jumlah ulasan

  var isRedStar; // Variabel untuk menentukan apakah bintang merah

  // Konstruktor untuk kelas Rating
  Rating({this.rate, this.count});

  // Metode konversi dari JSON ke objek Rating
  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] == null ? 0.0 : json['rate'].toDouble();
    count = json['count'];
  }

  // Metode konversi dari objek Rating ke JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
