import 'package:firebase_exam/model/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    // Check if item already in cart using `any()`
    var exists = _cartItems.any((cartItem) => cartItem.title == item.title);

    if (exists) {
      // Update quantity if item exists
      _cartItems
          .firstWhere((cartItem) => cartItem.title == item.title)
          .quantity += 1;
    } else {
      _cartItems.add(item);
    }

    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
