class BaskettItem {
  BaskettItem({
    required this.id,
    required this.productName,
    required this.productPrice,
    this.productQuantity = 0,
  });

  final String id;
  final String productName;
  final double productPrice;
  int productQuantity = 0;
}
