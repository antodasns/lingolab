// To parse this JSON data, do
//
//     final purchase = purchaseFromJson(jsonString);

import 'dart:convert';

Purchase purchaseFromJson(String str) => Purchase.fromJson(json.decode(str));

String purchaseToJson(Purchase data) => json.encode(data.toJson());

class Purchase {
  Purchase({
    this.courseId,
    this.courseLevel,
    this.purchaseId,
    this.userId,
  });

  String courseId;
  String courseLevel;
  String purchaseId;
  String userId;

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
    courseId: json["course_id"],
    courseLevel: json["course_level"],
    purchaseId: json["purchase_id"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
    "course_level": courseLevel,
    "purchase_id": purchaseId,
    "user_id": userId,
  };
}
