import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hasta_rental/services/customer_service.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('booking');

class Booking {
  static Future<void> addBooking(
      {required String carName,
      required String username,
      required String custName,
      required String carPlate,
      required String phone,
      required DateTime startTime,
      required DateTime endTime,
      required String subTotal,
      required String payment,
      required String status}) async {
    DocumentReference documentReferencer = _mainCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "carName": carName,
      "username": username,
      "custName": custName,
      "carPlate": carPlate,
      "phone": phone,
      "startTime": startTime,
      "endTime": endTime,
      "subtotal": subTotal,
      "payment": payment,
      "status": status
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<QuerySnapshot> readBooking() async {
    QuerySnapshot bookingDoc = await _mainCollection.get();

    return bookingDoc;
  }

  static Future<QuerySnapshot> readOne() async {
    QuerySnapshot booking = await _mainCollection
        .where('username', isEqualTo: CustomerServ.username)
        .get();
    return booking;
  }

  static Future<void> updateItem({
    required String id,
    required String status,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(id);

    Map<String, dynamic> data = <String, dynamic>{
      "status": status,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }
}
