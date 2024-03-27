import 'dart:convert';

import 'package:app_food/common/image_resources.dart';
import 'package:equatable/equatable.dart';

List<PizzaEntity> pizzaEntityFromJson(String str) => List<PizzaEntity>.from(
    json.decode(str).map((x) => PizzaEntity.fromJson(x)));

String pizzaEntityToJson(List<PizzaEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PizzaEntity extends Equatable {
  final int? id;
  final String? name;
  final String? countryOrigin;
  final String? price;
  final String? image;
  final String? tags;

  const PizzaEntity({
    this.id,
    this.name,
    this.countryOrigin,
    this.price,
    this.image,
    this.tags,
  });

  PizzaEntity copyWith({
    int? id,
    String? name,
    String? countryOrigin,
    String? price,
    String? image,
    String? tags,
  }) =>
      PizzaEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        countryOrigin: countryOrigin ?? this.countryOrigin,
        price: price ?? this.price,
        image: image ?? this.image,
        tags: tags ?? this.tags,
      );

  factory PizzaEntity.fromJson(Map<String, dynamic> json) => PizzaEntity(
        id: json["id"],
        name: json["name"] ?? "s/n",
        countryOrigin: json["country_origin"] ?? "s/n",
        price: json["price"] ?? "\$12.34",
        image: json["image"] ?? ImageResources.imageDefault,
        tags: json["tags"] ?? "s/n",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_origin": countryOrigin,
        "price": price,
        "image": image,
        "tags": tags,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      countryOrigin,
      price,
      image,
      tags,
    ];
  }
}
