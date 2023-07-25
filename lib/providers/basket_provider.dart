import 'package:flutter/material.dart';
import 'package:gallery_application/models/basket_model.dart';

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

  void removeFromBasket(BaskettItem item){
    var isExist = false;
    _basket.forEach((e) {
      if (e.id == item.id) {
        isExist = true;
      }
    });
    if (isExist) {
      _basket.removeWhere((element) => element.id == item.id);
    } else {
      
    }

    notifyListeners();
  }
}
