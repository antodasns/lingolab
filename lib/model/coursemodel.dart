// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course({
    this.courseId,
    this.courseName,
    this.icon,
    this.description,
    this.aprice,
    this.bprice,
    this.cprice,
  });

  String courseId;
  String courseName;
  String icon;
  String description;
  String aprice;
  String bprice;
  String cprice;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    courseId: json["course_id"],
    courseName: json["course_name"],
    icon: json["icon"],
    description: json["description"],
    aprice: json["aprice"],
    bprice: json["bprice"],
    cprice: json["cprice"],
  );

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
    "course_name": courseName,
    "icon": icon,
    "description": description,
    "aprice": aprice,
    "bprice": bprice,
    "cprice": cprice,
  };
}
