/* ignore_for_file: non_constant_identifier_names

import 'package:fitfind/imports.dart';
import 'package:fitfind/model/product.dart';
import 'package:fitfind/model/Detail.dart';
import 'package:fitfind/widgets/card/Detail.dart';
import 'package:fitfind/view/home/Detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _value = 0;

  List<String> Categorietitle = [
    "All",
    "electronics",
    "jewelry",
    "men's clothing",
    "women's clothing"
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<dynamic>>? futureProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Add this line to set the key
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Hello Fashioner!',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Cart(),
              ));
            },
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black,
          ),
        ],
      ),
      drawer: DrawerMenu(), // Assuming DrawerMenu is correctly implemented
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 140,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/svgviewer-png-output.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(Categorietitle.length, (index) {
                  return MyRadioListTile<int>(
                    value: index,
                    groupValue: _value,
                    leading: Categorietitle[index],
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Article>>(
            future: _value == 0
                ? ApiControl.fetchArticle()
                : ApiControl.fetchArticleByCategorie(
                    Categorietitle[_value].toString()),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: (() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ArticlScreen(
                                            articalID:
                                                snapshot.data![index].id!,
                                          )));
                                }),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data![index].image!),
                                                fit: BoxFit.contain)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      snapshot.data![index].title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\$' +
                                          snapshot.data![index].price
                                              .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 253, 104, 104),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  : const Expanded(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ));
            },
          ),
        ],
      ),
    );
  }
}*/

// ignore_for_file: non_constant_identifier_names

// Import paket-paket yang diperlukan
import 'package:fitfind/imports.dart';
import 'package:fitfind/model/product.dart';
import 'package:fitfind/model/Detail.dart';
import 'package:fitfind/widgets/card/Detail.dart';
import 'package:fitfind/view/home/Detail_screen.dart';
import 'package:flutter/material.dart';

// Widget untuk menampilkan layar utama (home screen)
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _value = 0; // Nilai yang menunjukkan kategori yang dipilih

  List<String> Categorietitle = [
    "All",
    "electronics",
    "jewelry",
    "men's clothing",
    "women's clothing"
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<dynamic>>? futureProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Menetapkan kunci untuk Scaffold
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Hello Fashioner!',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Cart(),
              ));
            },
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black,
          ),
        ],
      ),
      drawer: DrawerMenu(), // Membuat drawer (menu geser samping)
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          // Menampilkan gambar banner di bagian atas halaman
          Container(
            width: MediaQuery.of(context).size.width,
            height: 140,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/svgviewer-png-output.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Menampilkan daftar kategori dalam bentuk radio button
          Container(
            padding: const EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(Categorietitle.length, (index) {
                  return MyRadioListTile<int>(
                    value: index,
                    groupValue: _value,
                    leading: Categorietitle[index],
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Menampilkan produk berdasarkan kategori yang dipilih
          FutureBuilder<List<Article>>(
            future: _value == 0
                ? ApiControl.fetchArticle()
                : ApiControl.fetchArticleByCategorie(
                    Categorietitle[_value].toString()),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: (() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ArticlScreen(
                                            articalID:
                                                snapshot.data![index].id!,
                                          )));
                                }),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data![index].image!),
                                                fit: BoxFit.contain)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Menampilkan judul produk
                                    Text(
                                      snapshot.data![index].title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Menampilkan harga produk
                                    Text(
                                      '\$' +
                                          snapshot.data![index].price
                                              .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 253, 104, 104),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  : const Expanded(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ));
            },
          ),
        ],
      ),
    );
  }
}
