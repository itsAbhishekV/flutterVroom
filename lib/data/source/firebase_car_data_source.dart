import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_vroom/data/exports.dart';

class FirebaseDataSource {
  final FirebaseFirestore firestore;

  FirebaseDataSource({required this.firestore});

  Future<List<Car>> getCarsData() async {
    final snapshot = await firestore.collection('cars').get();

    final res =
        snapshot.docs.map((carData) => Car.fromMap(carData.data())).toList();
    return res;
  }
}
