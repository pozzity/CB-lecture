import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../database.dart';

/// Database implementation using Firebase Firestore & Storage.
class FirestoreImplementation implements Database {
  final FirebaseFirestore _databaseReference = FirebaseFirestore.instance;

 

  @override
  Future<bool?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async {
    try {
    final Map<String, dynamic> record = 
      await _databaseReference.collection(collectionPath).add(recordMap)
      as Map<String, dynamic> ;
      return record.containsKey('id');
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<bool?> removeRecordByPath(
      String collectionPath, int documentId) async {
    try {
      await _databaseReference.collection('$collectionPath/$documentId')
      .doc().delete();
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }


  @override
  Future<List<Map<String, dynamic>>?> getCollection(
      String collectionPath) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> query = 
        await _databaseReference.collection(collectionPath).get();
      return query.docs as  List<Map<String, dynamic>> ;
    } on FirebaseException catch (e) {
      log(e.toString());
      return null;
    }
  }

}
