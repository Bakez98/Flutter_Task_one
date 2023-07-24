import 'package:flutter/material.dart';
import 'package:gallery_application/models/product_item.dart';

class BasketProvider extends ChangeNotifier {
  final List<ProductItem> _basket = [];

  List<ProductItem> get basket => _basket;

  void addProductToBasket(ProductItem productItem) {
    var isExist = false;
    _basket.forEach((e) {
      if (e.productName == productItem.productName) {
        isExist = true;
      }
    });

    if (!isExist) {
      _basket.add(productItem);
    } else {
      print("Item allready exists ");
    }
  }
}
