// ignore_for_file: avoid_print, non_constant_identifier_names
/*
import 'package:fitfind/model/Detail.dart';
import 'package:dio/dio.dart';

class ApiControl {
  var dio = Dio();

  static Future<List<Article>> fetchArticle() async {
    Response response = await Dio().get('https://fakestoreapi.com/products');
    return (response.data as List).map((x) => Article.fromJson(x)).toList();
  }

  static Future<List<Article>> fetchArticleByCategorie(
      String categoriename) async {
    Response response = await Dio()
        .get('https://fakestoreapi.com/products/category/$categoriename');
    return (response.data as List).map((x) => Article.fromJson(x)).toList();
  }

  static Future<Article> fetchArticleByID(int aricle_ID) async {
    Response response =
        await Dio().get('https://fakestoreapi.com/products/$aricle_ID');
    Article _article = Article.fromJson(response.data);
    return _article;
  }
}*/

// Import paket dan file yang diperlukan
import 'package:fitfind/model/Detail.dart';
import 'package:dio/dio.dart';

// Kelas ApiControl untuk mengelola panggilan API
class ApiControl {
  var dio = Dio(); // Instance dari Dio untuk melakukan panggilan HTTP

  // Fungsi untuk mengambil daftar artikel dari API
  static Future<List<Article>> fetchArticle() async {
    // Panggilan HTTP GET ke endpoint produk
    Response response = await Dio().get('https://fakestoreapi.com/products');
    // Konversi data JSON ke List<Article> menggunakan model Article
    return (response.data as List).map((x) => Article.fromJson(x)).toList();
  }

  // Fungsi untuk mengambil daftar artikel berdasarkan kategori dari API
  static Future<List<Article>> fetchArticleByCategorie(
      String categoriename) async {
    // Panggilan HTTP GET ke endpoint produk berdasarkan kategori
    Response response = await Dio()
        .get('https://fakestoreapi.com/products/category/$categoriename');
    // Konversi data JSON ke List<Article> menggunakan model Article
    return (response.data as List).map((x) => Article.fromJson(x)).toList();
  }

  // Fungsi untuk mengambil detail artikel berdasarkan ID dari API
  static Future<Article> fetchArticleByID(int aricle_ID) async {
    // Panggilan HTTP GET ke endpoint produk berdasarkan ID
    Response response =
        await Dio().get('https://fakestoreapi.com/products/$aricle_ID');
    // Konversi data JSON ke objek Article menggunakan model Article
    Article _article = Article.fromJson(response.data);
    return _article;
  }
}
