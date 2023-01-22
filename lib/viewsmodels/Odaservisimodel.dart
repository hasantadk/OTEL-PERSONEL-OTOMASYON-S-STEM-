import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Services/database.dart';
import 'package:proje/models/PerUsers.dart';
import '../models/Siparis.dart';
class Odaservisimodel extends ChangeNotifier {
  Database _database = Database();
  String _collectionPath = 'PerUsers';
  String _collectionPath2 = 'Siparis';


  Stream<List<Siparis>> getSiparisList(PerUsers perUsers) {
    /// stream<QuerySnapshot> --> Strea<mList<DocumentSnapshot>>
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getIstekListFromApi(_collectionPath, perUsers.tc, _collectionPath2)
        .map((querySnapshot) => querySnapshot.docs);

    ///Stream<List<DocumentSnapshot>> --> Stream<List<Siparis>>
    Stream<List<Siparis>> streamListSiparis = streamListDocument.map(
            (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => Siparis.fromMap(docSnap.data()))
            .toList());

    return streamListSiparis;
  }
  Future<void> odaservisi_gel(Siparis Siparis, PerUsers perUsers) async {
    await _database.deleteSupDocument(
        referecePath: _collectionPath,
        id: perUsers.tc,
        referecePath2: _collectionPath2,
        id2: Siparis.oda_no);
    perUsers.durum=true;
    await _database.updatedurum(users: perUsers);
  }
}
