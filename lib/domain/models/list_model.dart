// To parse this JSON data, do
//
//     final tourListResponse = tourListResponseFromJson(jsonString);

import 'dart:convert';

TopListResponse tourListResponseFromJson(String str) =>
    TopListResponse.fromJson(json.decode(str));

String tourListResponseToJson(TopListResponse data) =>
    json.encode(data.toJson());

class TopListResponse {
  TopListResponse({
    this.routes,
    this.message,
    this.status,
  });

  List<TopData>? routes;
  String? message;
  int? status;

  factory TopListResponse.fromJson(Map<String, dynamic> json) =>
      TopListResponse(
        routes: json["routes"] == null
            ? []
            : List<TopData>.from(
                json["routes"]!.map((x) => TopData.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "routes": routes == null
            ? []
            : List<dynamic>.from(routes!.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class TopData {
  TopData({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory TopData.fromJson(Map<String, dynamic> json) => TopData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
