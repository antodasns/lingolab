import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course({
    this.courseId,
    this.courseName,
  });

  String courseId;
  String courseName;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    courseId: json["course_id"],
    courseName: json["course_name"],
  );

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
    "course_name": courseName,
  };
}
