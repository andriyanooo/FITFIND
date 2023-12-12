/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitfind/imports.dart';
import 'package:fitfind/model/product.dart';

import '../../model/Detail.dart';

class ArticlScreen extends StatefulWidget {
  const ArticlScreen({Key? key, required this.articalID}) : super(key: key);
  final int articalID;

  @override
  _ArticlScreenState createState() => _ArticlScreenState();
}

class _ArticlScreenState extends State<ArticlScreen> {
  bool isStarred = false;
  int starCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Details Product',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder<Article>(
        future: ApiControl.fetchArticleByID(widget.articalID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading data'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data available'),
            );
          }

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    decoration: BoxDecoration(
                      image: snapshot.data!.image != null
                          ? DecorationImage(
                              image: NetworkImage(snapshot.data!.image!),
                              fit: BoxFit.contain,
                            )
                          : const DecorationImage(
                              image: AssetImage('path_to_placeholder_image'),
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data!.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.category?.toString() ??
                              'Unknown Category',
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isStarred = !isStarred;
                                  if (isStarred) {
                                    starCount++;
                                  } else {
                                    starCount--;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.star,
                                color: isStarred ? Colors.orange : Colors.grey,
                              ),
                            ),
                            Text(
                              starCount.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '(' +
                                  snapshot.data!.rating!.count.toString() +
                                  ' Reviews)',
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Information',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 7,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ' + snapshot.data!.price!.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Consumer<CartItems>(
                        builder: (context, cart, child) => GestureDetector(
                          onTap: () {
                            final ScaffoldMessengerState addToCartMsg =
                                ScaffoldMessenger.of(context);
                            addToCartMsg.showSnackBar(
                              const SnackBar(
                                  content: Text('Product added successfully')),
                            );
                            cart.addItem(
                              snapshot.data!.id.toString(),
                              snapshot.data!.title!,
                              snapshot.data!.price,
                              snapshot.data!.image!,
                              snapshot.data!.category!,
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            color: const Color(0xff0F172A),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: Text(
                                'Add To Cart',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}*/

// Import paket-paket yang diperlukan
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitfind/imports.dart';
import 'package:fitfind/model/product.dart'; // Mengimpor model produk
import '../../model/Detail.dart'; // Mengimpor model Detail

// Widget untuk menampilkan layar detail artikel
class ArticlScreen extends StatefulWidget {
  const ArticlScreen({Key? key, required this.articalID}) : super(key: key);
  final int articalID;

  @override
  _ArticlScreenState createState() => _ArticlScreenState();
}

class _ArticlScreenState extends State<ArticlScreen> {
  bool isStarred =
      false; // Menandakan apakah artikel ini ditandai sebagai favorit
  int starCount = 0; // Jumlah bintang (rating) artikel

  @override
  Widget build(BuildContext context) {
    // Membuat tampilan utama halaman detail artikel
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Details Product',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder<Article>(
        future: ApiControl.fetchArticleByID(widget.articalID),
        builder: (context, snapshot) {
          // Menampilkan indikator loading saat data belum selesai diambil
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Menampilkan pesan error jika terjadi kesalahan saat mengambil data
          else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading data'),
            );
          }
          // Menampilkan pesan jika data tidak tersedia
          else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data available'),
            );
          }

          // Membangun tampilan detail artikel
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    decoration: BoxDecoration(
                      // Menampilkan gambar artikel atau placeholder jika tidak tersedia
                      image: snapshot.data!.image != null
                          ? DecorationImage(
                              image: NetworkImage(snapshot.data!.image!),
                              fit: BoxFit.contain,
                            )
                          : const DecorationImage(
                              image: AssetImage('path_to_placeholder_image'),
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Menampilkan judul artikel
                    Text(
                      snapshot.data!.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Menampilkan kategori artikel
                        Text(
                          snapshot.data!.category?.toString() ??
                              'Unknown Category',
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        // Menampilkan rating dan tombol favorit
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isStarred = !isStarred;
                                  if (isStarred) {
                                    starCount++;
                                  } else {
                                    starCount--;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.star,
                                color: isStarred ? Colors.orange : Colors.grey,
                              ),
                            ),
                            Text(
                              starCount.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '(' +
                                  snapshot.data!.rating!.count.toString() +
                                  ' Reviews)',
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Information',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Menampilkan deskripsi artikel
                    Text(
                      snapshot.data!.description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 7,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              // Menampilkan harga artikel dan tombol "Add to Cart"
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Menampilkan harga artikel
                      Text(
                        '\$ ' + snapshot.data!.price!.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      // Menampilkan tombol "Add to Cart" dengan aksi mengupdate keranjang
                      Consumer<CartItems>(
                        builder: (context, cart, child) => GestureDetector(
                          onTap: () {
                            final ScaffoldMessengerState addToCartMsg =
                                ScaffoldMessenger.of(context);
                            addToCartMsg.showSnackBar(
                              const SnackBar(
                                  content: Text('Product added successfully')),
                            );
                            cart.addItem(
                              snapshot.data!.id.toString(),
                              snapshot.data!.title!,
                              snapshot.data!.price,
                              snapshot.data!.image!,
                              snapshot.data!.category!,
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            color: const Color(0xff0F172A),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: Text(
                                'Add To Cart',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
