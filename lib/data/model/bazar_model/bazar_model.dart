class BazarModel {
  String? id;
  String? imageUrl;
  String? name;
  String? description;
  String? price;

  BazarModel({this.id, this.imageUrl, this.name, this.description, this.price});

  factory BazarModel.fromJson(String id, Map<String, dynamic> json) {
    return BazarModel(
      id: id,
      price: json['price'] as String?,
      imageUrl: json['image_url'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'image_url': imageUrl,
        'name': name,
        'description': description,
      };
}
