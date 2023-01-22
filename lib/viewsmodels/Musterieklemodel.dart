import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Services/database.dart';
import 'package:proje/models/Users.dart';
import '../models/Oda.dart';

class Musterieklemodel extends ChangeNotifier {
  Database _database = Database();
  String _collectionPath = 'Users';
  String _collectionPath2 = 'Odalar';

  Future<void> musekle(Users user) async {
    await _database.addmus(collectionPath: _collectionPath,users: user);

  }
  Future<void> odaguncelle(Oda oda) async {
    oda.durum=false;
    await _database.odaguncelle(collectionPath: _collectionPath2,oda: oda);

  }
  Future<QuerySnapshot<Map<String, dynamic>>> kontrol(
      {required String tc}) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .where("tc", isEqualTo: tc)
        .limit(1)
        .get();
  }
}