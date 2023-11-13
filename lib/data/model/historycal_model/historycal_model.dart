class HistoricalModel {
  String? id;
  String? imageUrl;
  String? name;
  String? description;

  HistoricalModel({this.id, this.imageUrl, this.name, this.description});

  factory HistoricalModel.fromJson(String id, Map<String, dynamic> json) {
    return HistoricalModel(
      id: id,
      imageUrl: json['image_url'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_url': imageUrl,
        'name': name,
        'description': description,
      };
}
