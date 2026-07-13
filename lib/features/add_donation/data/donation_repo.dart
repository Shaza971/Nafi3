import 'package:cloud_firestore/cloud_firestore.dart';

class DonationRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addDonation({
    required String title,
    required String category,
    required String description,
    required String location,
    required String userId,
  }) async {
    await _firestore.collection("donations").add({
      "title": title,
      "category": category,
      "description": description,
      "location": location,
      "userId": userId,
      "createdAt": Timestamp.now(),
    });
  }
  Stream<QuerySnapshot> getDonationsByCategory(
    String category) {
  return _firestore
      .collection("donations")
      .where("category", isEqualTo: category)
      .snapshots();
}

Stream<QuerySnapshot> getDonations() {
  return FirebaseFirestore.instance
      .collection("donations")
      .snapshots();
}
}