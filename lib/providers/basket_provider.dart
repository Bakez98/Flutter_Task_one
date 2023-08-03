import 'package:flutter/material.dart';
import 'package:gallery_application/models/basket_model.dart';
import 'package:gallery_application/providers/product_provider.dart';
import 'package:provider/provider.dart';

class BasketProvider extends ChangeNotifier {
  final List<BaskettItem> _basket = [];

  List<BaskettItem> get basket => _basket;

  void addProductToBasket(
      String id, String productName, double productPrice, int productQuantity) {
    final newItem = BaskettItem(
      id: id,
      productName: productName,
      productPrice: productPrice,
    );
    var isExist = false;
    _basket.forEach((e) {
      if (e.id == newItem.id) {
        isExist = true;
      }
    });
    if (!isExist) {
      newItem.productQuantity = 1;
      _basket.add(newItem);
    } else {
      basket.where((e) => e.id == newItem.id).first.productQuantity++;
    }

    notifyListeners();
  }

  bool increaseQuantity(BaskettItem item, context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    final myItem = productProvider.products
        .where((element) => element.productName == item.productName)
        .first;
    if (myItem.productQuantity > 0) {
      myItem.productQuantity--;
      item.productQuantity++;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  // void increaseQuantity(BaskettItem item) {
  //   var isExist = false;
  //   _basket.forEach((e) {
  //     if (e.id == item.id) {
  //       isExist = true;
  //     }
  //   });
  //   if (!isExist) {
  //     item.productQuantity = 1;
  //     _basket.add(item);
  //   } else {
  //     basket.where((e) => e.id == item.id).first.productQuantity++;
  //   }

  //   notifyListeners();
  // }

  void removeFromBasket(BaskettItem item, context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    var isExist = false;
    _basket.forEach((e) {
      if (e.id == item.id) {
        isExist = true;
      }
    });
    if (isExist) {
      productProvider.products
          .where((element) => element.productName == item.productName)
          .first
          .productQuantity += item.productQuantity;
      _basket.removeWhere((element) => element.id == item.id);
    } else {}

    notifyListeners();
  }
}
