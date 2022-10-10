// class ProductModel {
//
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   String? category;
//   String? image;
//   Rating? rating;
//
//   ProductModel(
//       {this.id,
//         this.title,
//         this.price,
//         this.description,
//         this.category,
//         this.image,
//         this.rating});
//
//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     category = json['category'];
//     image = json['image'];
//     rating =
//     json['rating'] != null ? Rating.fromJson(json['rating']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['price'] = price;
//     data['description'] = description;
//     data['category'] = category;
//     data['image'] = image;
//     if (rating != null) {
//       data['rating'] = rating!.toJson();
//     }
//     return data;
//   }
// }
//
// class Rating {
//   double? rate;
//   int? count;
//
//   Rating({this.rate, this.count});
//
//   Rating.fromJson(Map<String, dynamic> json) {
//     rate = json['rate'];
//     count = json['count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['rate'] = rate;
//     data['count'] = count;
//     return data;
//   }
// }


// To parse this JSON data, do
//
//     final productModels = productModelsFromJson(jsonString);

// Dart imports:
import 'dart:convert';

List<ProductModel> productModelsFromJson(String str) =>
    List<ProductModel>.from(
        json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelsToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
     this.id,
     this.title,
     this.price,
     this.description,
     this.category,
     this.image,
     this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  Category? category;
  String? image;
  Rating? rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: categoryValues.map![json["category"]],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse![category],
    "image": image,
    "rating": rating?.toJson(),
  };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
     this.rate,
     this.count,
  });

  double? rate;
  int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
