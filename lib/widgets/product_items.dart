import 'package:flutter/material.dart';
import 'package:gallery_application/models/product_item.dart';
import 'package:gallery_application/providers/basket_provider.dart';
import 'package:provider/provider.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({Key? key, required this.product}) : super(key: key);

  final ProductItem product;

  @override
  Widget build(BuildContext context) {
    
    
    void _addToBasket() {
      final myProvider = Provider.of<BasketProvider>(context, listen: false);
      myProvider.addProductToBasket(product);
      print("Product add to basket");
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4, // Add a shadow to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        color: Colors.cyanAccent, // You can change this to any color you want

        child: ListTile(
          title: Text(product.productName),
          subtitle: Text(
            'Price: ${product.productPrice} \$ , Quantity: ${product.productQuantity}',
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  _addToBasket();
                  print("Product add to basket");
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
