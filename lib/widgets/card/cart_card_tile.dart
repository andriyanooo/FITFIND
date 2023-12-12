// Import library Flutter untuk mengakses fungsi dan widget Flutter
import 'package:flutter/material.dart';

// Import file custom 'imports.dart' untuk mengakses komponen atau konfigurasi tambahan
import 'package:fitfind/imports.dart';

// Widget kartu untuk item di keranjang belanja
class CartCardTile extends StatefulWidget {
  final String? id;
  final String? productId;
  final double? price;
  final int? quantity;
  final String? name;
  final String? image;
  final String? category;

  const CartCardTile({
    Key? key,
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.name,
    this.image,
    this.category,
  }) : super(key: key);

  @override
  _CartCardTileState createState() => _CartCardTileState();
}

class _CartCardTileState extends State<CartCardTile> {
  int _currentQuantity = 0;

  @override
  void initState() {
    super.initState();
    _currentQuantity = widget.quantity ?? 0;
  }

  // Metode untuk menambahkan satu item ke keranjang belanja
  void _increaseQuantity() {
    setState(() {
      _currentQuantity++;
    });
  }

  // Metode untuk mengurangi satu item dari keranjang belanja
  void _decreaseQuantity() {
    setState(() {
      if (_currentQuantity > 0) {
        _currentQuantity--;
      }
    });
  }

  // Metode untuk menambahkan item ke keranjang belanja dan mencetak informasi di konsol
  void _addToCart() {
    print('Item added to cart: ${widget.name}, Quantity: $_currentQuantity');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final totalPrice = (widget.price! * _currentQuantity); // logic total
    // cart
    // mengatur ukuran  untuk menghasil tampilan UI yg bagus
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                widget.image!,
                height: size.height,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextBuilder(
                      text: widget.name!,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //categori
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextBuilder(text: widget.category, fontSize: 12.0),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: EdgeInsets.only(left: 2, right: 2),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: _decreaseQuantity,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Icon(Icons.remove,
                                color: Colors.black, size: 10.0),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        TextBuilder(
                          text: _currentQuantity.toString(),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                        const SizedBox(width: 10.0),
                        // logic untuk quantity
                        GestureDetector(
                          onTap: _increaseQuantity,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Icon(Icons.add,
                                color: Colors.black, size: 10.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      TextBuilder(
                        text: 'Total: \$${totalPrice.toStringAsFixed(2)}',
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
