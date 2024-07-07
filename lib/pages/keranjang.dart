import 'package:flutter/material.dart';

void main() {
  runApp(KeranjangScreen());
}

class KeranjangScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
        ),
        body: ProductListScreen(),
      ),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ItemProduk> produkList = [
    ItemProduk(
      name: 'Rekomendasi Velg 1 fdf',
      price: 1000000,
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.xEfGwoqq8-a5rPA-lmh9sQHaEK&pid=Api&P=0&h=180',
      category: 'Velg',
    ),
    ItemProduk(
      name: 'Rekomendasi velg 2',
      price: 1500000,
      imageUrl:
          'https://tse4.mm.bing.net/th?id=OIP.MBwvDN_xW9OaQ0v2K0_8IwHaEK&pid=Api&P=0&h=180',
      category: 'Velg',
    ),
    ItemProduk(
      name: 'Rekomendasi velg 3',
      price: 2000000,
      imageUrl:
          'https://tse4.mm.bing.net/th?id=OIP.40tq0vj7AvoI8CsKlmc7BAHaFj&pid=Api&P=0&h=180',
      category: 'Velg',
    )
  ];

  Map<ItemProduk, int> cartItems = {};

  void addToCart(ItemProduk product) {
    setState(() {
      if (cartItems.containsKey(product)) {
        cartItems[product] = cartItems[product]! + 1; // Increment quantity by 1
      } else {
        cartItems[product] = 1; // Initialize quantity to 1 if not already in cart
      }
    });
  }

  void removeFromCart(ItemProduk product) {
    setState(() {
      if (cartItems.containsKey(product) && cartItems[product]! > 0) {
        cartItems[product] = cartItems[product]! - 1; // Decrement quantity by 1
        if (cartItems[product] == 0) {
          cartItems.remove(product); // Remove product from cart if quantity is zero
        }
      }
    });
  }

  double calculateTotal() {
    double total = 0;
    cartItems.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 100),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: produkList.length,
              itemBuilder: (context, index) {
                return ItemProdukWidget(
                  produk: produkList[index],
                  addToCart: () => addToCart(produkList[index]),
                  removeFromCart: () => removeFromCart(produkList[index]),
                  quantity: cartItems.containsKey(produkList[index])
                      ? cartItems[produkList[index]]!
                      : 0,
                  beliSekarang: () {
                    addToCart(produkList[index]); // Tambahkan produk ke keranjang
                    // Lanjutkan dengan logika untuk navigasi atau apa pun yang diperlukan
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${calculateTotal()}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Logika untuk melakukan pembayaran
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Payment'),
                              content: Text('Total payment: \$${calculateTotal()}'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Pay'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Logika untuk menambahkan semua produk ke keranjang
                        setState(() {
                          for (var product in produkList) {
                            if (!cartItems.containsKey(product)) {
                              cartItems[product] = 1; // Tambahkan produk ke keranjang dengan jumlah 1
                            } else {
                              cartItems[product] = cartItems[product]! + 1; // Increment jumlah produk yang sudah ada
                            }
                          }
                        });
                      },
                      child: Text('Beli Semuanya'),
                    ),
                  ],
                ),
              ],
            ),
          ),
      
        ],
      ),
    );
  }
}

class ItemProduk {
  final String name;
  final int price;
  final String imageUrl;
  final String category;

  ItemProduk({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}

class ItemProdukWidget extends StatelessWidget {
  final ItemProduk produk;
  final VoidCallback addToCart;
  final VoidCallback removeFromCart;
  final VoidCallback beliSekarang;
  final int quantity;

  ItemProdukWidget({
    required this.produk,
    required this.addToCart,
    required this.removeFromCart,
    required this.beliSekarang,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            produk.imageUrl,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            produk.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Price: \$${produk.price}',
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
          SizedBox(height: 5),
          Text(
            'Category: ${produk.category}',
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: addToCart,
                icon: Icon(Icons.add),
              ),
              Text('$quantity'),
              IconButton(
                onPressed: removeFromCart,
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        
        ],
      ),
    );
  }
}
