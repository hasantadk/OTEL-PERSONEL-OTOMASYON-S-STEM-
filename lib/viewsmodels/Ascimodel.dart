import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proje/Services/database.dart';
import 'package:proje/models/PerUsers.dart';
import '../models/Siparis.dart';

class Ascimodel extends ChangeNotifier {
  Database _database = Database();
   String _collectionPath = 'PerUsers';
   String _collectionPath2 = 'YemekSiparis';
   String _colpath2 = "Siparis";
   String _colpath3 = "Odaservisi";

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

  Future<void>  addtemiz({required Siparis tem})async {
    await _database.setT(path:tem.oda_no,Istek: tem.toMap(),colpath:_collectionPath ,colpath2: _colpath2,colpath3: _colpath3);
  }
  Future<void> temizlikonay(Siparis Istek,PerUsers perUsers) async {
    await _database.deleteSupDocument(
        referecePath: _collectionPath,
        id: perUsers.tc,
        referecePath2: _collectionPath2,
        id2: Istek.oda_no);

  }
}
