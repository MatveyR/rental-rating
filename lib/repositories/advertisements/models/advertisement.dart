import 'package:cloud_firestore/cloud_firestore.dart';

class Advertisement {
  final String? address;
  final int? deposit;
  final String? description;
  final int? fee;
  final int? floor;
  final int? maxFloor;
  final int? price;
  final int? rooms;
  final bool? servicePayment;
  final int? term;
  final int? type;
  final int? year;
  final int? square;
  final String? imageUrl;

  const Advertisement({
    required this.address,
    required this.deposit,
    required this.description,
    required this.fee,
    required this.floor,
    required this.maxFloor,
    required this.price,
    required this.rooms,
    required this.servicePayment,
    required this.square,
    required this.term,
    required this.type,
    required this.year,
    required this.imageUrl
  });

  factory Advertisement.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options
  ) {
    final data = snapshot.data();
    return Advertisement(
      address: data?['address'],
      deposit: data?['deposit'],
      description: data?['description'],
      fee: data?['fee'],
      floor: data?['floor'],
      maxFloor: data?['maxFloor'],
      price: data?['price'],
      rooms: data?['rooms'],
      servicePayment: data?['ServicePayment'],
      square: data?['square'],
      term: data?['term'],
      type: data?['type'],
      year: data?['year'],
      imageUrl: data?['imageUrl']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (address != null) "address" : address,
      if (deposit != null) "deposit" : deposit,
      if (description != null) "description" : description,
      if (fee != null) "fee" : fee,
      if (floor != null) "floor" : floor,
      if (maxFloor != null) "maxFloor" : maxFloor,
      if (price != null) "price" : price,
      if (rooms != null) "rooms" : rooms,
      if (servicePayment != null) "servicePayment" : servicePayment,
      if (term != null) "term" : term,
      if (type != null) "type" : type,
      if (year != null) "year" : year,
      if (imageUrl != null) "imageUrl" : imageUrl,
    };
  }
}
