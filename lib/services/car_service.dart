import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('car');

class CarSer {
  static String? carName;

  static Future<QuerySnapshot> readCar() async {
    var mainCollection =
        await _mainCollection.where("carAvailable", isEqualTo: true).get();

    return mainCollection;
  }

  static Future<void> addCar({
    required String username,
    required String fullname,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(carName);

    Map<String, dynamic> data = <String, dynamic>{};

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }
}
