import 'package:flutter/material.dart';

class SelectedItemProvider extends ChangeNotifier {
  String? selectedItem;

  void setSelectedItem(String itemName) {
    selectedItem = itemName;
    notifyListeners();
  }
}
