import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course({
    this.courseId,
    this.courseName,
    this.icon,
  });

  String courseId;
  String courseName;
  String icon;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    courseId: json["course_id"],
    courseName: json["course_name"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
    "course_name": courseName,
    "icon": icon,
  };
}
