import 'dart:convert';

class Coffee {
  String? imageUrl;
  String? name;
  String? description;
  double? price;
  double? review;
  bool? hasCoffee;
  bool? hasMilk;
  bool? isRoasted;

  Coffee({
    this.imageUrl,
    this.name,
    this.description,
    this.price,
    this.review,
    this.hasCoffee,
    this.hasMilk,
    this.isRoasted,
  });

  Coffee copyWith({
    String? imageUrl,
    String? name,
    String? description,
    double? price,
    double? review,
    bool? hasCoffee,
    bool? hasMilk,
    bool? isRoasted,
  }) {
    return Coffee(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      review: review ?? this.review,
      hasCoffee: hasCoffee ?? this.hasCoffee,
      hasMilk: hasMilk ?? this.hasMilk,
      isRoasted: isRoasted ?? this.isRoasted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'description': description,
      'price': price,
      'review': review,
      'hasCoffee': hasCoffee,
      'hasMilk': hasMilk,
      'isRoasted': isRoasted,
    };
  }

  factory Coffee.fromMap(Map<String, dynamic> map) {
    return Coffee(
      imageUrl: map['imageUrl'],
      name: map['name'],
      description: map['description'],
      price: map['price']?.toDouble(),
      review: map['review']?.toDouble(),
      hasCoffee: map['hasCoffee'],
      hasMilk: map['hasMilk'],
      isRoasted: map['isRoasted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Coffee.fromJson(String source) => Coffee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Coffee(imageUrl: $imageUrl, name: $name, description: $description, price: $price, review: $review, hasCoffee: $hasCoffee, hasMilk: $hasMilk, isRoasted: $isRoasted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Coffee &&
      other.imageUrl == imageUrl &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.review == review &&
      other.hasCoffee == hasCoffee &&
      other.hasMilk == hasMilk &&
      other.isRoasted == isRoasted;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      review.hashCode ^
      hasCoffee.hashCode ^
      hasMilk.hashCode ^
      isRoasted.hashCode;
  }
}
