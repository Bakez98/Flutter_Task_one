class ProductItem {
  ProductItem({
    required this.id,
    required this.productName,
    required this.productPrice,
    this.productQuantity = 0,
  });

  final String id;
  final String productName;
  double productPrice;
  int productQuantity;
}
