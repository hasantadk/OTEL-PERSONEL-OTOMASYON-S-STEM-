import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Services/database.dart';
import 'package:proje/models/PerUsers.dart';

import '../models/Istek.dart';

class Temizlikcimodel extends ChangeNotifier {
  Database _database = Database();
  String _collectionPath = 'PerUsers';
  String _collectionPath2 = 'Servis_istek';

  Stream<List<Istek>> getIstekList(PerUsers perUsers) {
    /// stream<QuerySnapshot> --> Strea<mList<DocumentSnapshot>>
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getIstekListFromApi(_collectionPath,perUsers.tc,_collectionPath2)
        .map((querySnapshot) => querySnapshot.docs);

    ///Stream<List<DocumentSnapshot>> --> Stream<List<Istek>>
    Stream<List<Istek>> streamListIstek = streamListDocument.map(
            (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => Istek.fromMap(docSnap.data()))
            .toList());

    return streamListIstek;
  }
  Future<void> temizlikonay(Istek Istek,PerUsers perUsers) async {
    await _database.deleteSupDocument(
        referecePath: _collectionPath,
        id: perUsers.tc,
        referecePath2: _collectionPath2,
        id2: Istek.oda_no);
    await _database.updatedurum(users: perUsers);
  }
}