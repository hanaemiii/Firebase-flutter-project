// shopping_cart.dart
import 'package:flutter/foundation.dart';

class ShoppingCart with ChangeNotifier {
  late final List<Map<String, dynamic>> items;

  ShoppingCart() : items = [];

  void addToCart(Map<String, dynamic> item) {
    items.add(item);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> item) {
    items.removeWhere((element) => element == item);
    notifyListeners();
  }
}
