import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('rental');

class CustomerServ {
  static String? username;
  static String? password;

  static Future<void> addItem(
      {required String username,
      required String fullname,
      required String ic,
      required String matricNo,
      required String phone,
      required String email,
      required String password}) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(username).collection('customer').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "username": username,
      "fullname": fullname,
      "ic": ic,
      "matricNo": matricNo,
      "phone": phone,
      "email": email,
      "password": password,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String username,
    required String fullname,
    required String ic,
    required String matricNo,
    required String phone,
    required String email,
    required String password,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(username).collection('customer').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "username": username,
      "fullname": fullname,
      "ic": ic,
      "matricNo": matricNo,
      "phone": phone,
      "email": email,
      "password": password,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference customerCollections =
        _mainCollection.doc(username).collection('customer');

    return customerCollections.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(username).collection('customer').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
