import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('booking');

class ReportService {
  static Future<QuerySnapshot> readItems() async {
    var mainCollection = await _mainCollection.get();

    return mainCollection;
  }
}
