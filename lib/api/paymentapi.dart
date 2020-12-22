import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lingolab/model/purchasemodel.dart';
import 'package:lingolab/state/coursestate.dart';
import 'package:provider/provider.dart';

Future<Purchase> courseBrought(courseId,courseLevel,userId) async {
  Purchase _purchase=Purchase();
  _purchase.courseId=courseId;
  _purchase.courseLevel=courseLevel;
  _purchase.userId=userId;
  courseBroughtUpload(_purchase);
  return _purchase;
}

void courseBroughtUpload(Purchase purchase) async {
  CollectionReference purchases = FirebaseFirestore.instance.collection('purchase');
  DocumentReference documentRef = await purchases.add(purchase.toJson());
  purchase.purchaseId = documentRef.id;
  await documentRef.set(purchase.toJson());
}

Future<String> userPurchase(BuildContext context,userId,courseId,level) async{
  await FirebaseFirestore.instance.collection('purchase').get().then((querySnapshot) {

    List<Purchase> purchase = List<Purchase>();
    List<Purchase> purchases = List<Purchase>();
    querySnapshot.docs.forEach((document) {
      purchase.add(mapFirestoreDocToPurchase(document));
      purchases=purchase.where((Purchase purchase) => purchase.userId ==userId && purchase.courseId ==courseId && purchase.courseLevel ==level).toList();
      String succ;
      if (purchases.length>0){
        succ="success";
      }
      else{
        succ="not";
      }
      Provider.of<CourseNotifier>(context, listen: false).purchased = succ;
    });
  });
return "bhhh";
}

Purchase mapFirestoreDocToPurchase(document) {
  Purchase purchase = Purchase();
  document.data().forEach((key, value) {
    if (key == 'purchase_id') {
      purchase.purchaseId = value;
    }
    if (key == 'user_id') {
      purchase.userId = value;
    }
    if (key == 'course_id') {
      purchase.courseId = value;
    }
    if (key == 'course_level') {
      purchase.courseLevel = value;
    }
  }
  );
  return purchase;
}