import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    int id;
    String name;
    String slug;
    String description;
    int parentId;
    dynamic image;
    DateTime createdAt;
    DateTime updatedAt;
    List<SubCategory> subCategory;
    String products;

    Welcome({
        this.id,
        this.name,
        this.slug,
        this.description,
        this.parentId,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.subCategory,
        this.products,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"] == null ? null : json["description"],
        parentId: json["parent_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subCategory: List<SubCategory>.from(json["subCategory"].map((x) => SubCategory.fromJson(x))),
        products: json["products"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description == null ? null : description,
        "parent_id": parentId,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subCategory": List<dynamic>.from(subCategory.map((x) => x.toJson())),
        "products": products,
    };
}

class SubCategory {
    int id;
    String name;
    String slug;
    String description;
    int parentId;
    dynamic image;
    DateTime createdAt;
    DateTime updatedAt;
    List<SubCategory> subCategory;
    String img;
    String products;

    SubCategory({
        this.id,
        this.name,
        this.slug,
        this.description,
        this.parentId,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.subCategory,
        this.img,
        this.products,
    });

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"] == null ? null : json["description"],
        parentId: json["parent_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subCategory: List<SubCategory>.from(json["subCategory"].map((x) => SubCategory.fromJson(x))),
        img: json["img"] == null ? null : json["img"],
        products: json["products"] == null ? null : json["products"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description == null ? null : description,
        "parent_id": parentId,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subCategory": List<dynamic>.from(subCategory.map((x) => x.toJson())),
        "img": img == null ? null : img,
        "products": products == null ? null : products,
    };
}
