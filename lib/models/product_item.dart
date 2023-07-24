class ProductItem {
  const ProductItem({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
  });

  final String id;
  final String productName;
  final double productPrice;
  final int productQuantity;
}
