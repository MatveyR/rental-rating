import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rental_rating/repositories/advertisements/models/advertisement.dart';

class AdvertisementsRepository {
  final CollectionReference repository =
      FirebaseFirestore.instance.collection('advertisements');

  Future<List<Advertisement>> getAllAdvertisements() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await repository.get() as QuerySnapshot<Map<String, dynamic>>;
    List<Advertisement> advertisements = snapshot.docs
        .map((DocumentSnapshot<Map<String, dynamic>> doc) =>
            Advertisement.fromFirestore(doc, null))
        .toList();
    return advertisements;
  }
}
