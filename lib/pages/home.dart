import 'package:flutter/material.dart';

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  String selectedCategory = 'Semua'; // Default category
  final List<ItemProduk> produkList = [
    ItemProduk(
      name: 'Rekomendasi Velg 1 fdf',
      price: '\Rp.1000000',
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.xEfGwoqq8-a5rPA-lmh9sQHaEK&pid=Api&P=0&h=180',
      category: 'Velg',
    ),
    ItemProduk(
      name: 'Rekomendasi velg 2',
      price: '\Rp.1500000',
      imageUrl:
          'https://tse4.mm.bing.net/th?id=OIP.MBwvDN_xW9OaQ0v2K0_8IwHaEK&pid=Api&P=0&h=180',
      category: 'Velg',
    ),
    ItemProduk(
      name: 'Rekomendasi velg 3',
      price: '\Rp.2000000',
      imageUrl:
          'https://tse4.mm.bing.net/th?id=OIP.40tq0vj7AvoI8CsKlmc7BAHaFj&pid=Api&P=0&h=180',
      category: 'Velg',
    ),
    ItemProduk(
      name: 'Rekomendasi lampu 1',
      price: '\Rp.500000',
      imageUrl:
          'https://tse4.mm.bing.net/th?id=OIP.eyHjfblAxQXNeLU3xDGjVwHaHa&pid=Api&P=0&h=180',
      category: 'Lampu',
    ),
    ItemProduk(
      name: 'Rekomendasi lampu 2',
      price: '\Rp.75000',
      imageUrl:
          'https://tse1.mm.bing.net/th?id=OIP.UZbW0OrbkiOQOZPCKypY_gHaHa&pid=Api&P=0&h=180',
      category: 'Lampu',
    ),
    ItemProduk(
      name: 'Rekomendasi lampu 3',
      price: '\Rp.85000',
      imageUrl:
          'https://tse1.mm.bing.net/th?id=OIP.HBTMagK7ez2KqCt7zxfp9QHaHa&pid=Api&P=0&h=180',
      category: 'Lampu',
    ),
    ItemProduk(
      name: 'Shock Terbaik 1',
      price: '\Rp.120000',
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.ZaIKIW8rBkoltMJCmRIGUQHaHa&pid=Api&P=0&h=180',
      category: 'Shock',
    ),
    ItemProduk(
      name: 'Shock Terbaik 2',
      price: '\RP1400000',
      imageUrl:
          'https://tse4.mm.bing.net/th?id=OIP.XtKQA0FAbF1_wtRsQRDtdgHaIQ&pid=Api&P=0&h=180',
      category: 'Shock',
    ),
    ItemProduk(
      name: 'Shock Terbaik 3',
      price: '\Rp.1600000',
      imageUrl:
          'https://tse1.mm.bing.net/th?id=OIP.JEDYl0IO3vEGfZnajWQpXAHaGe&pid=Api&P=0&h=180',
      category: 'Shock',
    ),
    ItemProduk(
      name: 'Ban Terbaik 1',
      price: '\Rp.700000',
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.saOd9yptSw78PC8kod_SjwHaHa&pid=Api&P=0&h=180',
      category: 'Ban',
    ),
    ItemProduk(
      name: 'Ban Terbaik 2',
      price: '\Rp.90000',
      imageUrl:
          'https://tse2.mm.bing.net/th?id=OIP.aDlP1FsW4DEl4U6lnmLY2gHaHa&pid=Api&P=0&h=180',
      category: 'Ban',
    ),
    ItemProduk(
      name: 'Ban Terbaik 3',
      price: '\Rp.10010',
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.wtLFWivSYj-w4WS0ry8HgQHaHa&pid=Api&P=0&h=180',
      category: 'Ban',
    ),
  ];

  List<ItemProduk> get filteredProdukList {
    if (selectedCategory == 'Semua') {
      return produkList;
    } else {
      return produkList
          .where((produk) => produk.category == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Icon(Icons.menu),
            SizedBox(width: 10),
            Text('Racing'),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(produkList));
              },
            ),
            // Icon(Icons.shopping_cart),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tombol Kategori
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TombolKategori(
                    title: 'Semua', onTap: () => filterByCategory('Semua')),
                TombolKategori(
                    title: 'Velg', onTap: () => filterByCategory('Velg')),
                TombolKategori(
                    title: 'Lampu', onTap: () => filterByCategory('Lampu')),
                TombolKategori(
                    title: 'Shock', onTap: () => filterByCategory('Shock')),
                TombolKategori(
                    title: 'Ban', onTap: () => filterByCategory('Ban')),
              ],
            ),
          ),
          // Bagian Highlight
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Best Seller!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: filteredProdukList.map((produk) {
                return ItemProduk(
                  name: produk.name,
                  price: produk.price,
                  imageUrl: produk.imageUrl,
                  category: produk.category,
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }
}

class TombolKategori extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  TombolKategori({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(title),
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final String category;

  ItemProduk(
      {required this.name,
      required this.price,
      required this.imageUrl,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Text(price),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<ItemProduk> produkList;

  CustomSearchDelegate(this.produkList);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<ItemProduk> searchResults = produkList
        .where(
            (produk) => produk.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: searchResults.map((result) {
        return ItemProduk(
          name: result.name,
          price: result.price,
          imageUrl: result.imageUrl,
          category: result.category,
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ItemProduk> searchResults = produkList
        .where(
            (produk) => produk.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: searchResults.map((result) {
        return ItemProduk(
          name: result.name,
          price: result.price,
          imageUrl: result.imageUrl,
          category: result.category,
        );
      }).toList(),
    );
  }
}
