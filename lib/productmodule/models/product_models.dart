// To parse this JSON data, do
//
//     final productModel = productFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.imageLink,
    required this.productLink,
    required this.websiteLink,
    required this.description,
    required this.tagList,
    required this.createdAt,
    required this.updatedAt,
    required this.productApiUrl,
    required this.apiFeaturedImage,
    required this.productColors,
  });

  int id;
  String brand;
  String name;
  String price;
  String imageLink;
  String productLink;
  String websiteLink;
  String description;

  List<String> tagList;
  DateTime createdAt;
  DateTime updatedAt;
  String productApiUrl;
  String apiFeaturedImage;
  List<ProductColor> productColors;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
        imageLink: json["image_link"],
        productLink: json["image_link"],
        websiteLink: json["website_link"],
        description: json["description"],
        tagList: List<String>.from(json["tag_list"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        productApiUrl: json["product_api_url"],
        apiFeaturedImage: json["api_featured_image"],
        productColors: List<ProductColor>.from(
            json["product_colors"].map((x) => ProductColor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "name": name,
        "price": price,
        "image_link": imageLink,
        "product_link": productLink,
        "website_link": websiteLink,
        "description": description,
        "tag_list": List<dynamic>.from(tagList.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product_api_url": productApiUrl,
        "api_featured_image": apiFeaturedImage,
        "product_colors":
            List<dynamic>.from(productColors.map((x) => x.toJson())),
      };
}

enum Category {
  PENCIL,
  LIPSTICK,
  LIQUID,
  EMPTY,
  POWDER,
  LIP_GLOSS,
  GEL,
  CREAM,
  PALETTE,
  CONCEALER,
  HIGHLIGHTER,
  BB_CC,
  CONTOUR,
  LIP_STAIN,
  MINERAL
}

final categoryValues = EnumValues({
  "bb_cc": Category.BB_CC,
  "concealer": Category.CONCEALER,
  "contour": Category.CONTOUR,
  "cream": Category.CREAM,
  "": Category.EMPTY,
  "gel": Category.GEL,
  "highlighter": Category.HIGHLIGHTER,
  "lipstick": Category.LIPSTICK,
  "lip_gloss": Category.LIP_GLOSS,
  "lip_stain": Category.LIP_STAIN,
  "liquid": Category.LIQUID,
  "mineral": Category.MINERAL,
  "palette": Category.PALETTE,
  "pencil": Category.PENCIL,
  "powder": Category.POWDER
});

enum Currency { CAD, USD, GBP }

final currencyValues =
    EnumValues({"CAD": Currency.CAD, "GBP": Currency.GBP, "USD": Currency.USD});

enum PriceSign { EMPTY, PRICE_SIGN }

final priceSignValues =
    EnumValues({"\u0024": PriceSign.EMPTY, "£": PriceSign.PRICE_SIGN});

class ProductColor {
  ProductColor({
    required this.hexValue,
    // required this.colourName,
  });

  String hexValue;
  // String colourName;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        // colourName: json["colour_name"],
      );

  Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        // "colour_name": colourName,
      };
}

enum ProductType {
  LIP_LINER,
  LIPSTICK,
  FOUNDATION,
  EYELINER,
  EYESHADOW,
  BLUSH,
  BRONZER,
  MASCARA,
  EYEBROW,
  NAIL_POLISH
}

final productTypeValues = EnumValues({
  "blush": ProductType.BLUSH,
  "bronzer": ProductType.BRONZER,
  "eyebrow": ProductType.EYEBROW,
  "eyeliner": ProductType.EYELINER,
  "eyeshadow": ProductType.EYESHADOW,
  "foundation": ProductType.FOUNDATION,
  "lipstick": ProductType.LIPSTICK,
  "lip_liner": ProductType.LIP_LINER,
  "mascara": ProductType.MASCARA,
  "nail_polish": ProductType.NAIL_POLISH
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}

