import 'package:flutter/material.dart';
import 'package:gallery_application/models/product_item.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductItem> _products = [];

  List<ProductItem> get products => _products;

  void addProduct(
      String productName, double productPrice, int productQuantity) {
    final newId = _products.length + 1;
    final newItem = ProductItem(
        id: newId.toString(),
        productName: productName,
        productPrice: productPrice,
        productQuantity: productQuantity);

    var isExist = false;
    _products.forEach((e) {
      if (e.productName == productName) {
        isExist = true;
      }
    });
    if (!isExist) {
      _products.add(newItem);
    } else {
      print("the item is already exist $isExist");
    }

    notifyListeners();
  }

  void removeProduct(ProductItem productItem) {
    if (_products.contains(productItem)) {
      _products.remove(productItem);
    } else {
      //do nothiing if item allready in the products list
    }
    notifyListeners();
  }

  void reduceQuantity(ProductItem productItem) {
    var isExist = false;
    _products.forEach((e) {
      if (e.id == productItem.id) {
        isExist = true;
      }
    });

    if (isExist) {
      _products.where((e) => e.id == productItem.id).first.productQuantity--;
    }

    notifyListeners();
  }
}
