import 'package:firebase_exam/api_service.dart';
import 'package:firebase_exam/myroutes.dart';
import 'package:firebase_exam/product_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    products = await ApiService.fetchProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 70),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cart);
            },
          ),
        ],
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Image.network(
                      "https://img.freepik.com/free-vector/gradient-shopping-discount-horizontal-sale-banner_23-2150321996.jpg?t=st=1728742399~exp=1728745999~hmac=07c9103b550a9380d897affd09915ae2af034cb3deb9442b4c083be171363e4a&w=826",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Featured Products',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    children: List.generate(products.length, (index) {
                      return ProductCard(
                        title: products[index]['title'],
                        imageUrl: products[index]['image'],
                        price: products[index]['price'].toDouble(),
                      );
                    }),
                  ),
                ],
              ),
            ),
    );
  }
}
