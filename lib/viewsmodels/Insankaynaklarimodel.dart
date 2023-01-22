import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Services/database.dart';
import 'package:proje/models/PerUsers.dart';
import 'package:proje/models/Users.dart';

import '../models/Oda.dart';

class Insankaynaklarimodel extends ChangeNotifier {
  Database _database = Database();
  String _collectionPath = 'PerUsers';

  Future<void> perekle(PerUsers user) async {
    await _database.addper(collectionPath: _collectionPath,users: user);

  }
  Future<QuerySnapshot<Map<String, dynamic>>> kontrol(
      {required String tc}) async {
    return await FirebaseFirestore.instance
        .collection("PerUsers")
        .where("tc", isEqualTo: tc)
        .limit(1)
        .get();
  }
}