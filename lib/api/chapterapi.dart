import 'package:flutter/cupertino.dart';
import 'package:lingolab/model/chapter.dart';
import 'package:lingolab/model/course.dart';
//import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingolab/state/course.dart';
import "package:provider/provider.dart";
import 'dart:convert';

void getChapterListFromFirestore(BuildContext context,courseid,level) async {

  await FirebaseFirestore.instance.collection('chapters').get().then((querySnapshot) {
    List<Chapter> chapterList = List<Chapter>();
    List<Chapter> chapterLists = List<Chapter>();
    querySnapshot.docs.forEach((document) {
      chapterList.add(mapFirestoreDocToChapter(document,courseid,level));
      chapterLists=chapterList.where((Chapter chapter) => chapter.courseId ==courseid && chapter.courseLevel ==level).toList();
    });
    Provider.of<CourseNotifier>(context, listen: false).chapterList = chapterLists;
  });

}
Chapter mapFirestoreDocToChapter(document,courseid,level) {
  Chapter chapter = Chapter();
  document.data().forEach((key, value) {
    if (key == 'chapter_id') {
      chapter.chapterId = value;
    }
    if (key == 'course_id') {
      chapter.courseId = value;
    }
    if (key == 'chapter_name') {
      chapter.chapterName = value;
    }
    if (key == 'course_level') {
      chapter.courseLevel = value;
    }
  }
  );
  return chapter;
}