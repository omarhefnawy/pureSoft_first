class ProductModel {
  final String name;
  final String description;
  final double oldPrice;
  final double newPrice;
  int quantity;

  ProductModel({
    required this.name,
    required this.description,
    required this.oldPrice,
    required this.newPrice,
    this.quantity = 1, // Default to 1
  });
}