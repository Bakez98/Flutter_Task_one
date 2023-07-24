import 'package:flutter/material.dart';
import 'package:gallery_application/models/product_item.dart';
import 'package:gallery_application/providers/basket_provider.dart';
import 'package:provider/provider.dart';

class ProductsBasket extends StatefulWidget {
  const ProductsBasket({Key? key}) : super(key: key);

  @override
  _ProductsBasketState createState() => _ProductsBasketState();
}

class _ProductsBasketState extends State<ProductsBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Consumer<BasketProvider>(
        builder: (context, basketProvider, child) {
          List<ProductItem> basket = basketProvider.basket;
          return ListView.builder(
            itemCount: basket.length,
            itemBuilder: (context, index) {

            },
          );
        },
      ),
    );
  }
}

