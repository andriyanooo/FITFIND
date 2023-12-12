/*import 'package:fitfind/imports.dart';

import 'dart:convert';

List<ProductResponse> productResponseFromJson(String str) =>
    List<ProductResponse>.from(json.decode(str).map((x) => ProductResponse.fromJson(x)));

String productResponseToJson(List<ProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResponse {
  ProductResponse({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        image: json["image"] == null ? null : json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "image": image == null ? null : image,
        "rating": rating == null ? null : rating!.toJson(),
      };
}

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  double? rate;
  int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"] == null ? null : json["rate"].toDouble(),
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate == null ? null : rate,
        "count": count == null ? null : count,
      };
}
*/

// Import paket dan file yang diperlukan
import 'package:fitfind/imports.dart';

// Fungsi konversi JSON menjadi List<ProductResponse>
List<ProductResponse> productResponseFromJson(String str) =>
    List<ProductResponse>.from(
        json.decode(str).map((x) => ProductResponse.fromJson(x)));

// Fungsi konversi List<ProductResponse> menjadi JSON
String productResponseToJson(List<ProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Kelas model ProductResponse untuk merepresentasikan respons produk dari API
class ProductResponse {
  int? id; // ID produk
  String? title; // Judul produk
  double? price; // Harga produk
  String? description; // Deskripsi produk
  String? category; // Kategori produk
  String? image; // URL gambar produk
  Rating? rating; // Informasi rating produk

  // Konstruktor untuk kelas ProductResponse
  ProductResponse({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  // Metode konversi dari JSON ke objek ProductResponse
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        image: json["image"] == null ? null : json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  // Metode konversi dari objek ProductResponse ke JSON
  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "image": image == null ? null : image,
        "rating": rating == null ? null : rating!.toJson(),
      };
}

// Kelas model Rating untuk merepresentasikan informasi rating produk
class Rating {
  double? rate; // Nilai rating
  int? count; // Jumlah ulasan

  // Konstruktor untuk kelas Rating
  Rating({
    this.rate,
    this.count,
  });

  // Metode konversi dari JSON ke objek Rating
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"] == null ? null : json["rate"].toDouble(),
        count: json["count"] == null ? null : json["count"],
      );

  // Metode konversi dari objek Rating ke JSON
  Map<String, dynamic> toJson() => {
        "rate": rate == null ? null : rate,
        "count": count == null ? null : count,
      };
}
