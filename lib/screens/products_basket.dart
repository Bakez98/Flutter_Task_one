import 'package:flutter/material.dart';
import 'package:gallery_application/models/basket_model.dart';
import 'package:gallery_application/models/product_item.dart';
import 'package:gallery_application/providers/basket_provider.dart';
import 'package:gallery_application/widgets/basket_items.dart';
import 'package:provider/provider.dart';

class ProductsBasket extends StatefulWidget {
  const ProductsBasket({Key? key}) : super(key: key);

  @override
  _ProductsBasketState createState() => _ProductsBasketState();
}

class _ProductsBasketState extends State<ProductsBasket> {
  @override
  Widget build(BuildContext context) {
    final basketLength =
        Provider.of<BasketProvider>(context, listen: false).basket.length;
    return Scaffold(
      body: Consumer<BasketProvider>(builder: (context, basketProvider, child) {
        List<BaskettItem> basket = basketProvider.basket;
        if (basket.isEmpty) {
          return Center(
            child: Image.asset(
              'assets/images/empty-cart.png',
              height: 300,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: basket.length,
            itemBuilder: (context, index) {
              return BasketItems(item: basket[index]);
            },
          );
        }
      }),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(12),
          height: 50.0,
          // color: Theme.of(context).colorScheme.background,
          child: Center(
            child: basketLength > 0
                ? Text("You Have ${basketLength.toString()} in Your Basket")
                : const Text(""),
          )),
    );
  }
}
