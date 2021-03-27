// To parse this JSON data, do
//
//     final products = productsFromMap(jsonString);

import 'dart:convert';
import 'package:product_list/domain/domain.dart';

Products productsFromMap(String str) => Products.fromMap(json.decode(str));

String productsToMap(Products data) => json.encode(data.toMap());

class Products {
  Products({
    this.success,
    this.data,
  });

  int success;
  List<ProductsDatum> data;

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        success: json["success"],
        data: List<ProductsDatum>.from(
            json["data"].map((x) => ProductsDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class ProductsDatum {
  ProductsDatum({
    this.productId,
    this.title,
    this.imageUrl,
    this.purchasePrice,
    this.productVariant,
  });

  String productId;
  String title;
  String imageUrl;
  dynamic purchasePrice;
  dynamic productVariant;

  factory ProductsDatum.fromMap(Map<String, dynamic> json) => ProductsDatum(
        productId: json["product_id"],
        title: json["title"],
        imageUrl: json["image_url"],
        purchasePrice: json["purchase_price"],
        productVariant: json["product_variant"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "title": title,
        "image_url": imageUrl,
        "purchase_price": purchasePrice,
        "product_variant": productVariant,
      };
}
