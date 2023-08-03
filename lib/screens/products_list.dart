import 'package:flutter/material.dart';
import 'package:gallery_application/models/product_item.dart';
import 'package:gallery_application/providers/product_provider.dart';
import 'package:gallery_application/widgets/product_items.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          List<ProductItem> products = productProvider.products;

          if (products.length <= 0) {
            return Center(
              child: Image.asset(
                'assets/images/noproduct1.png',
                height: 300,
              ),
            );
          } else {
            return Scrollbar(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  ProductItem product = products[index];
                  return ProductItems(product: product);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
