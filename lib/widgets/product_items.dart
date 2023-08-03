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
  }

  void _RemoveFromBasket(context) {
    final myProvider = Provider.of<ProductProvider>(context, listen: false);

    myProvider.reduceQuantityofItemBasket(product, context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.productName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Image(
                image: AssetImage("assets/images/xbox.jpg"),
              ),
              const SizedBox(height: 8),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Quantity: ${product.productQuantity}"),
                    SizedBox(height: 16),
                    Text(
                      "${product.productPrice} \$",
                      style: const TextStyle(fontSize: 32),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      _RemoveFromBasket(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _addToBasket(context);
                    },
                  ),
                  ElevatedButton(
                    child: Text("Add to Basket"),
                    onPressed: () {
                      _addToBasket(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
