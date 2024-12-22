class FoodModel {
  final int? id;
  final String name;
  final String type;
  final double km;
  final double price;
  final double rate;
  final String imageUrl;
  final String remaining;
  final bool isFavorite;

  FoodModel({
    required this.id,
    required this.name,
    required this.type,
    required this.km,
    required this.price,
    required this.rate,
    required this.imageUrl,
    required this.remaining,
    required this.isFavorite,
  });
}
