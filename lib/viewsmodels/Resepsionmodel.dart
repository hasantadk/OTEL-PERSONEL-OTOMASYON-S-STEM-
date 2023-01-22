import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Services/database.dart';
import '../models/Oda.dart';

class Resepsionmodel extends ChangeNotifier {
  Database _database = Database();
  String _collectionPath = 'Odalar';

  Stream<List<Oda>> getOdaList() {
    /// stream<QuerySnapshot> --> Strea<mList<DocumentSnapshot>>
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getUsersListFromApi(_collectionPath,)
        .map((querySnapshot) => querySnapshot.docs);

    ///Stream<List<DocumentSnapshot>> --> Stream<List<Oda>>
    Stream<List<Oda>> streamListOda = streamListDocument.map(
            (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => Oda.fromMap(docSnap.data()))
            .toList());

    return streamListOda;
  }
  Future<void> musremove({required Oda oda}) async {
    var ref=await _database.getodaid(colpath: "Users",colpath2: oda.oda_no);
    await _database.deleteDocument(referecePath: ref );
  }
  Future<void> odaguncel(Oda oda) async {
    oda.durum=true;
    await _database.odaguncelle(collectionPath: _collectionPath,oda: oda);

  }
  
}