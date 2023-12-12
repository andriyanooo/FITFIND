// Impor paket dan file yang diperlukan
import 'package:fitfind/imports.dart';

// Kelas model untuk item di keranjang belanja
class CartModel {
  final String? id; // ID unik untuk setiap item
  final String? name; // Nama produk
  final int? quantity; // Jumlah produk dalam keranjang
  final dynamic price; // Harga produk
  final String? category; // Kategori produk
  final String? image; // URL gambar produk

  // Konstruktor untuk CartModel
  CartModel({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.price,
    @required this.category,
    @required this.image,
  });
}

// Kelas CartItems untuk mengelola status keranjang belanja
class CartItems with ChangeNotifier {
  // Map untuk menyimpan item keranjang dengan ID produk sebagai kunci
  Map<String, CartModel> _items = {};

  // Metode getter untuk mendapatkan salinan item keranjang
  Map<String, CartModel> get items {
    return {..._items};
  }

  // Metode getter untuk mendapatkan jumlah total item di keranjang
  int get itemCount {
    return _items.length;
  }

  // Metode untuk menambahkan item ke keranjang
  void addItem(String productId, String name, dynamic price, String image,
      String category) {
    if (_items.containsKey(productId)) {
      // Jika item sudah ada di keranjang, perbarui jumlahnya
      _items.update(
        productId,
        (existingCartItem) => CartModel(
          id: DateTime.now().toString(),
          name: existingCartItem.name,
          quantity: existingCartItem.quantity! + 1,
          price: existingCartItem.price,
          category: existingCartItem.category,
          image: existingCartItem.image,
        ),
      );
    } else {
      // Jika item belum ada di keranjang, tambahkan ke keranjang
      _items.putIfAbsent(
          productId,
          () => CartModel(
                id: DateTime.now().toString(),
                name: name,
                quantity: 1,
                price: price,
                category: category,
                image: image,
              ));
    }
    // Memberi tahu pendengar untuk memperbarui UI
    notifyListeners();
  }

  // Metode untuk menghapus item dari keranjang
  void removeItem(String id) {
    _items.remove(id);
    // Memberi tahu pendengar untuk memperbarui UI
    notifyListeners();
  }

  // Metode untuk mengurangi jumlah dari suatu item di keranjang
  void removeSingleItem(String id) {
    if (_items.containsKey(id)) {
      return;
    }
    if (_items[id]!.quantity! > 1) {
      // Jika jumlah lebih dari 1, kurangi jumlahnya
      _items.update(
          id,
          (existingCartItem) => CartModel(
                id: DateTime.now().toString(),
                name: existingCartItem.name,
                quantity: existingCartItem.quantity! - 1,
                price: existingCartItem.price,
                category: existingCartItem.category,
                image: existingCartItem.image,
              ));
    }
    // Memberi tahu pendengar untuk memperbarui UI
    notifyListeners();
  }

  // Metode untuk menghapus semua item dari keranjang
  void clear() {
    _items = {};
    // Memberi tahu pendengar untuk memperbarui UI
    notifyListeners();
  }
}
