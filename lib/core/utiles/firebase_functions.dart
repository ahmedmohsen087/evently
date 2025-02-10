import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FirebaseFunctions {
  static Future<bool> createAccount(
      String emailAddress, String password) async {
    EasyLoading.show();
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  static Future<bool> login(String emailAddress, String password) async {
    EasyLoading.show();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  static CollectionReference<EventDataModel> getCollectionReference() {
    return FirebaseFirestore.instance
        .collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(
            fromFirestore: (snapshot, _) =>
                EventDataModel.fromFireStore(snapshot.data()!),
            toFirestore: (eventModel, _) => eventModel.toFireStore());
  }

  static Future<void> createNewEvent(EventDataModel eventData) async {
    final collectionRef = getCollectionReference();
    var docRef = collectionRef.doc();
    eventData.eventID = docRef.id;

    return docRef.set(eventData);
  }

  getEvents() {
    final collectionRef = getCollectionReference();
    //  return collectionRef.snapshots();
  }
}
