import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmeasy/models/medicalstore.dart';
import 'package:pharmeasy/models/medicines.dart';
import 'package:pharmeasy/models/medicinesShort.dart';
import 'package:pharmeasy/models/orders.dart';
import 'package:pharmeasy/models/requests.dart';
import 'models/user.dart';
class Collections {
  static const String users = 'users';
  static const String requests = 'requests';
  static const String orders = 'orders';
  static const String medicalStore = 'medicalStore';
  static const String medicines = 'medicines';
  // static const String medicinesShort = 'medicinesShort';

  static final usersRef =
  FirebaseFirestore.instance.collection(Collections.users).withConverter(
    fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
    toFirestore: (users, _) => users.toJson(),
  );
  static final requestsRef =
  FirebaseFirestore.instance.collection(Collections.requests).withConverter(
    fromFirestore: (snapshot, _) => Requests.fromJson(snapshot.data()!),
    toFirestore: (requests, _) => requests.toJson(),
  );
  static final ordersRef =
  FirebaseFirestore.instance.collection(Collections.orders).withConverter(
    fromFirestore: (snapshot, _) => Orders.fromJson(snapshot.data()!),
    toFirestore: (orders, _) => orders.toJson(),
  );
   static final medicalStoreRef =
  FirebaseFirestore.instance.collection(Collections.medicalStore).withConverter(
    fromFirestore: (snapshot, _) => MedicalStore.fromJson(snapshot.data()!),
    toFirestore: (medicalStore, _) => medicalStore.toJson(),
  );
   static final medicinesRef =
  FirebaseFirestore.instance.collection(Collections.medicines).withConverter(
    fromFirestore: (snapshot, _) => Medicines.fromJson(snapshot.data()!),
    toFirestore: (medicines, _) => medicines.toJson(),
  );
static final medicinesShortRef =
  FirebaseFirestore.instance.collection(Collections.medicinesShort).withConverter(
    fromFirestore: (snapshot, _) => MedicinesShort.fromJson(snapshot.data()!),
    toFirestore: (medicinesShort, _) => medicinesShort.toJson(),
  );


}
