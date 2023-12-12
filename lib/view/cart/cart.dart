// Import paket-paket yang diperlukan
import 'package:fitfind/imports.dart'; // Berkas berisi impor paket dan konfigurasi aplikasi
import 'package:fitfind/widgets/card/cart_card_tile.dart'; // Widget untuk menampilkan kartu keranjang

// Widget untuk menampilkan halaman keranjang belanja
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // Mengakses data keranjang belanja menggunakan Provider
    final cart = Provider.of<CartItems>(context);

    // Membangun tampilan halaman keranjang belanja dengan menggunakan SafeArea dan Scaffold
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          title: AppName(), // Menampilkan nama aplikasi di bagian atas halaman
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15),
          itemCount: cart.items.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int i) {
            // Menampilkan setiap item dalam keranjang menggunakan widget CartCardTile
            return CartCardTile(
              id: cart.items.values.toList()[i].id!,
              productId: cart.items.keys.toList()[i],
              price: cart.items.values.toList()[i].price!,
              quantity: cart.items.values.toList()[i].quantity!,
              name: cart.items.values.toList()[i].name!,
              category: cart.items.values.toList()[i].category!,
              image: cart.items.values.toList()[i].image!,
            );
          },
        ),
      ),
    );
  }
}
