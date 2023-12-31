import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_application/models/product_item.dart';
import 'package:gallery_application/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:gallery_application/providers/product_provider.dart';

class AddProducts extends StatelessWidget {
  AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var cont = context.watch<SettingsProvider>();
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _productNameController =
        TextEditingController();
    final TextEditingController _productPriceController =
        TextEditingController();
    final TextEditingController _productQuantityController =
        TextEditingController();

    void _createProduct() {
      if (_formKey.currentState!.validate()) {
        final myProvider = Provider.of<ProductProvider>(context, listen: false);

        if (myProvider.addProduct(
          _productNameController.text,
          double.parse(_productPriceController.text),
          int.parse(_productQuantityController.text),
        )) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              width: 200,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              behavior: SnackBarBehavior.floating,
              content: const Text(
                  "Item Allready Exist Quantity and Price Is Updated Successfully"),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              width: 200,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              behavior: SnackBarBehavior.floating,
              content: const Text("Added Successfully"),
            ),
          );
          Navigator.pop(context);
        }
      }
    }

    return Directionality(
      textDirection:
          cont.isArabicLanguageSelected ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: Text(cont.language["add_product"])),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _productNameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z]'),
                    ),
                  ],
                  decoration:
                      InputDecoration(labelText: cont.language["product_name"]),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product name.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: cont.language["price"]),
                  controller: _productPriceController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}$')), // Only allow digits
                  ],
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price.';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Invalid price. Please enter a valid number.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: cont.language["quantity"]),
                  controller: _productQuantityController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]')), // Only allow digits
                  ],
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a quantity.';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Invalid quantity. Please enter a valid number.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _createProduct,
                  child: Text(cont.language["create_product"]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
