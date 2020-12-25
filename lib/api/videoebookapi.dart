import 'package:flutter/cupertino.dart';
import 'package:lingolab/model/chaptermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingolab/model/videoebookmodel.dart';
import 'package:lingolab/state/coursestate.dart';
import "package:provider/provider.dart";

Future<String> getVideoebookListFromFirestore(BuildContext context,chapterid) async {

  await FirebaseFirestore.instance.collection('video_ebook').get().then((querySnapshot) {
    List<VideoEbook> veList = List<VideoEbook>();
    List<VideoEbook> veLists = List<VideoEbook>();
    querySnapshot.docs.forEach((document) {
      veList.add(mapFirestoreDocToVideoebook(document));
      veLists=veList.where((VideoEbook videoebook) => videoebook.chapterId ==chapterid).toList();
    });
    Provider.of<CourseNotifier>(context, listen: false).veList = veLists;
  });
  return "bhhh";
}
Future<String> getVideoebookListfullFromFirestore(BuildContext context) async {

  await FirebaseFirestore.instance.collection('video_ebook').get().then((querySnapshot) {
    List<VideoEbook> veList = List<VideoEbook>();
    List<VideoEbook> veLists = List<VideoEbook>();
    querySnapshot.docs.forEach((document) {
      veList.add(mapFirestoreDocToVideoebook(document));
    });
    Provider.of<CourseNotifier>(context, listen: false).veListfull = veList;
  });
  return "bhhh";
}
VideoEbook mapFirestoreDocToVideoebook(document) {
  VideoEbook videoebook = VideoEbook();
  document.data().forEach((key, value) {
    if (key == 've_id') {
      videoebook.veId = value;
    }
    if (key == 'chapter_id') {
      videoebook.chapterId = value;
    }
    if (key == 'video_name') {
      videoebook.videoName = value;
    }
    if (key == 'video_url') {
      videoebook.videoUrl = value;
    }
    if (key == 'ebook_name') {
      videoebook.ebookName = value;
    }
    if (key == 'ebook_url') {
      videoebook.ebookUrl = value;
    }
  }
  );
  return videoebook;
}