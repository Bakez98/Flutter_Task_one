import 'package:flutter/material.dart';
import 'package:gallery_application/models/basket_model.dart';
import 'package:gallery_application/providers/basket_provider.dart';
import 'package:provider/provider.dart';

class BasketItems extends StatelessWidget {
  const BasketItems({Key? key, required this.item}) : super(key: key);

  final BaskettItem item;

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
        color: Colors.cyanAccent, // You can change this to any color you want

        child: ListTile(
          title: Text(item.productName),
          subtitle: Text(
            'Price: ${item.productPrice} \$ , Quantity: ${item.productQuantity}',
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // IconButton(
              //   icon: const Icon(Icons.remove),
              //   onPressed: () {},
              // ),
              // IconButton(
              //   icon: const Icon(Icons.add),
              //   onPressed: () {
              //     Provider.of<BasketProvider>(context, listen: false)
              //         .increaseQuantity(item);

              //   },
              // ),
              IconButton(
                  onPressed: () {
                    Provider.of<BasketProvider>(context, listen: false)
                        .removeFromBasket(item);
                  },
                  icon: const Icon(
                    Icons.delete_forever_sharp,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
