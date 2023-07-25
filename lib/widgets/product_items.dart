import 'package:flutter/material.dart';
import 'package:gallery_application/models/product_item.dart';
import 'package:gallery_application/providers/basket_provider.dart';
import 'package:gallery_application/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({Key? key, required this.product}) : super(key: key);

  final ProductItem product;

  void _addToBasket(context) {
    final myProvider = Provider.of<BasketProvider>(context, listen: false);
    if (product.productQuantity > 0) {
      myProvider.addProductToBasket(product.id, product.productName,
          product.productPrice, product.productQuantity);
      Provider.of<ProductProvider>(context, listen: false)
          .reduceQuantity(product);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: 200,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
          content: const Text("Not Enough Product Quantity!"),
        ),
      );
    }
    // Provider.of<ProductProvider>(context, listen: false)
    //     .products
    //     .where((e) => e.id == product.id)
    //     .first
    //     .productQuantity--;

    print("Product add to basket");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4, // Add a shadow to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        color: Colors.cyanAccent,

        child: ListTile(
          title: Text(product.productName),
          subtitle: Text(
            'Price: ${product.productPrice} \$ , Quantity: ${product.productQuantity}',
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.delete_forever_sharp,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  _addToBasket(context);
                  print("Product add to basket");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
