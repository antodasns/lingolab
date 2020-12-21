import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingolab/model/purchasemodel.dart';

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
