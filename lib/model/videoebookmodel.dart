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
    this.videolength,
    this.ebookName,
    this.ebookUrl,
    this.ebookpages,
    this.ebooksize,
  });

  String veId;
  String chapterId;
  String videoName;
  String videoUrl;
  String videolength;
  String ebookName;
  String ebookUrl;
  String ebookpages;
  String ebooksize;

  factory VideoEbook.fromJson(Map<String, dynamic> json) => VideoEbook(
    veId: json["ve_id"],
    chapterId: json["chapter_id"],
    videoName: json["video_name"],
    videoUrl: json["video_url"],
    videolength: json["videolength"],
    ebookName: json["ebook_name"],
    ebookUrl: json["ebook_url"],
    ebookpages: json["ebookpages"],
    ebooksize: json["ebooksize"],
  );

  Map<String, dynamic> toJson() => {
    "ve_id": veId,
    "chapter_id": chapterId,
    "video_name": videoName,
    "video_url": videoUrl,
    "videolength": videolength,
    "ebook_name": ebookName,
    "ebook_url": ebookUrl,
    "ebookpages": ebookpages,
    "ebooksize": ebooksize,
  };
}
