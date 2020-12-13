import 'dart:convert';

Chapter chapterFromJson(String str) => Chapter.fromJson(json.decode(str));

String chapterToJson(Chapter data) => json.encode(data.toJson());

class Chapter {
  Chapter({
    this.chapterId,
    this.chapterName,
    this.courseId,
    this.courseLevel,
  });

  String chapterId;
  String chapterName;
  String courseId;
  String courseLevel;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    chapterId: json["chapter_id"],
    chapterName: json["chapter_name"],
    courseId: json["course_id"],
    courseLevel: json["course_level"],
  );

  Map<String, dynamic> toJson() => {
    "chapter_id": chapterId,
    "chapter_name": chapterName,
    "course_id": courseId,
    "course_level": courseLevel,
  };
}
