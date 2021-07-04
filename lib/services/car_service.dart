import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('car');

class CarSer {
  static String? carName;
  static String? carID;

  static Future<QuerySnapshot> readCar() async {
    var mainCollection =
        await _mainCollection.where("carAvailable", isEqualTo: true).get();

    return mainCollection;
  }

  static Future<void> updateCar({
    required bool available,
    required String carId,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(carId);

    Map<String, dynamic> data = <String, dynamic>{
      "carAvailable": available,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }
}
