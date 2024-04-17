// To parse this JSON data, do
//
//     final profileData = profileDataFromJson(jsonString);

import 'dart:convert';

ProfileData profileDataFromJson(String str) => ProfileData.fromJson(json.decode(str));

String profileDataToJson(ProfileData data) => json.encode(data.toJson());

class ProfileData {
  final SeoSettings? seoSettings;
  final List<Deal>? deals;

  ProfileData({
    this.seoSettings,
    this.deals,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    seoSettings: json["seo_settings"] == null ? null : SeoSettings.fromJson(json["seo_settings"]),
    deals: json["deals"] == null ? [] : List<Deal>.from(json["deals"]!.map((x) => Deal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "seo_settings": seoSettings?.toJson(),
    "deals": deals == null ? [] : List<dynamic>.from(deals!.map((x) => x.toJson())),
  };
}

class Deal {
  final int? id;
  final int? commentsCount;
  final DateTime? createdAt;
  final int? createdAtInMillis;
  final String? imageMedium;
  final Store? store;

  Deal({
    this.id,
    this.commentsCount,
    this.createdAt,
    this.createdAtInMillis,
    this.imageMedium,
    this.store,
  });

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
    id: json["id"],
    commentsCount: json["comments_count"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    createdAtInMillis: json["created_at_in_millis"],
    imageMedium: json["image_medium"],
    store: json["store"] == null ? null : Store.fromJson(json["store"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comments_count": commentsCount,
    "created_at": createdAt?.toIso8601String(),
    "created_at_in_millis": createdAtInMillis,
    "image_medium": imageMedium,
    "store": store?.toJson(),
  };
}

class Store {
  final String? name;

  Store({
    this.name,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class SeoSettings {
  final String? seoTitle;
  final String? seoDescription;
  final String? webUrl;

  SeoSettings({
    this.seoTitle,
    this.seoDescription,
    this.webUrl,
  });

  factory SeoSettings.fromJson(Map<String, dynamic> json) => SeoSettings(
    seoTitle: json["seo_title"],
    seoDescription: json["seo_description"],
    webUrl: json["web_url"],
  );

  Map<String, dynamic> toJson() => {
    "seo_title": seoTitle,
    "seo_description": seoDescription,
    "web_url": webUrl,
  };
}



