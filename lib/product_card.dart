import 'package:firebase_exam/model/cart_model.dart';
import 'package:firebase_exam/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;

  ProductCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 150,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$ $price',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  var cartItem =
                      CartItem(title: title, imageUrl: imageUrl, price: price);
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(cartItem);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$title added to cart')),
                  );
                  Logger().i('$title added to cart');
                },
                icon: const Icon(Icons.add_shopping_cart),
              ),
              IconButton(
                onPressed: () {
                  // Favorite functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$title added to favorites')),
                  );
                },
                icon: const Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {
                  // Share functionality (this just shows a message for now)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Share $title with others')),
                  );
                },
                icon: const Icon(Icons.share),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
