// To parse this JSON data, do
//
//     final videoEbook = videoEbookFromJson(jsonString);

import 'dart:convert';

VideoEbook videoEbookFromJson(String str) => VideoEbook.fromJson(json.decode(str));

String videoEbookToJson(VideoEbook data) => json.encode(data.toJson());

class VideoEbook {
  VideoEbook({
    this.veId,
    this.chapterId,
    this.videoName,
    this.videoUrl,
    this.ebookName,
    this.ebookUrl,
  });

  String veId;
  String chapterId;
  String videoName;
  String videoUrl;
  String ebookName;
  String ebookUrl;

  factory VideoEbook.fromJson(Map<String, dynamic> json) => VideoEbook(
    veId: json["ve_id"],
    chapterId: json["chapter_id"],
    videoName: json["video_name"],
    videoUrl: json["video_url"],
    ebookName: json["ebook_name"],
    ebookUrl: json["ebook_url"],
  );

  Map<String, dynamic> toJson() => {
    "ve_id": veId,
    "chapter_id": chapterId,
    "video_name": videoName,
    "video_url": videoUrl,
    "ebook_name": ebookName,
    "ebook_url": ebookUrl,
  };
}
