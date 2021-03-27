// To parse this JSON data, do
//
//     final categoryList = categoryListFromMap(jsonString);

import 'dart:convert';

CategoryList categoryListFromMap(String str) =>
    CategoryList.fromMap(json.decode(str));

String categoryListToMap(CategoryList data) => json.encode(data.toMap());

class CategoryList {
  CategoryList({
    this.success,
    this.data,
  });

  int success;
  List<Datum> data;

  factory CategoryList.fromMap(Map<String, dynamic> json) => CategoryList(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.categoryId,
    this.categoryName,
    this.description,
    this.banner,
    this.cutoffFrom,
    this.cutoffTo,
    this.createdDate,
    this.updatedDate,
    this.displayOrder,
    this.status,
    this.expectedTime,
    this.expDelText,
    this.subCategories,
  });

  String categoryId;
  String categoryName;
  dynamic description;
  String banner;
  String cutoffFrom;
  String cutoffTo;
  DateTime createdDate;
  DateTime updatedDate;
  String displayOrder;
  String status;
  DatumExpectedTime expectedTime;
  ExpDelText expDelText;
  List<SubCategory> subCategories;

  @override
  bool operator ==(Object other) {
    return other != null && other is Datum && categoryId == other.categoryId;
  }

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        description: json["description"],
        banner: json["banner"],
        cutoffFrom: json["cutoff_from"],
        cutoffTo: json["cutoff_to"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        displayOrder: json["display_order"],
        status: json["status"],
        expectedTime: datumExpectedTimeValues.map[json["expected_time"]],
        expDelText: expDelTextValues.map[json["exp_del_text"]],
        subCategories: List<SubCategory>.from(
            json["sub_categories"].map((x) => SubCategory.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "description": description,
        "banner": banner,
        "cutoff_from": cutoffFrom,
        "cutoff_to": cutoffTo,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "display_order": displayOrder,
        "status": status,
        "expected_time": datumExpectedTimeValues.reverse[expectedTime],
        "exp_del_text": expDelTextValues.reverse[expDelText],
        "sub_categories":
            List<dynamic>.from(subCategories.map((x) => x.toMap())),
      };
}

enum ExpDelText {
  EXPECTED_DELIVERY_TODAY_WITHIN_3_HOURS,
  EXPECTED_DELIVERY_NEXT_DAY_BEFORE_1_PM
}

final expDelTextValues = EnumValues({
  "Expected delivery next day before 1 PM":
      ExpDelText.EXPECTED_DELIVERY_NEXT_DAY_BEFORE_1_PM,
  "Expected delivery today within 3 hours":
      ExpDelText.EXPECTED_DELIVERY_TODAY_WITHIN_3_HOURS
});

enum DatumExpectedTime { THE_1100_PM, SUNDAY_MAR_14900_PM, THE_1159_PM }

final datumExpectedTimeValues = EnumValues({
  "Sunday, Mar 14 9:00 PM": DatumExpectedTime.SUNDAY_MAR_14900_PM,
  "11:00 PM": DatumExpectedTime.THE_1100_PM,
  "11:59 PM": DatumExpectedTime.THE_1159_PM
});

class SubCategory {
  SubCategory({
    this.subCategoryId,
    this.subCategoryName,
    this.category,
    this.banner,
    this.cutoffFrom,
    this.cutoffTo,
    this.displayOrder,
    this.status,
    this.createdDate,
    this.updatedDate,
    this.expectedTime,
  });

  String subCategoryId;
  String subCategoryName;
  String category;
  String banner;
  String cutoffFrom;
  String cutoffTo;
  String displayOrder;
  String status;
  DateTime createdDate;
  String updatedDate;
  SubCategoryExpectedTime expectedTime;

  factory SubCategory.fromMap(Map<String, dynamic> json) => SubCategory(
        subCategoryId: json["sub_category_id"],
        subCategoryName: json["sub_category_name"],
        category: json["category"],
        banner: json["banner"],
        cutoffFrom: json["cutoff_from"],
        cutoffTo: json["cutoff_to"],
        displayOrder: json["display_order"],
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: json["updated_date"],
        expectedTime: subCategoryExpectedTimeValues.map[json["expected_time"]],
      );

  Map<String, dynamic> toMap() => {
        "sub_category_id": subCategoryId,
        "sub_category_name": subCategoryName,
        "category": category,
        "banner": banner,
        "cutoff_from": cutoffFrom,
        "cutoff_to": cutoffTo,
        "display_order": displayOrder,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate,
        "expected_time": subCategoryExpectedTimeValues.reverse[expectedTime],
      };
}

enum SubCategoryExpectedTime { THE_1000_PM, THE_0900_AM }

final subCategoryExpectedTimeValues = EnumValues({
  "09:00 AM": SubCategoryExpectedTime.THE_0900_AM,
  "10:00 PM": SubCategoryExpectedTime.THE_1000_PM
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
