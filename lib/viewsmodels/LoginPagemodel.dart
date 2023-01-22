import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Services/database.dart';
import '../models/Users.dart';

class LoginPagemodel extends ChangeNotifier{
  Database _database = Database();
  String _collectionPath = 'Users';


  Future<QuerySnapshot<Map<String, dynamic>>> kontrol(
    {required String tc,
      required String sifre}) async {
      return await FirebaseFirestore.instance
        .collection("Users")
        .where("tc", isEqualTo: tc)
        .where("sifre", isEqualTo: sifre)
        .limit(1)
        .get();
  }
  Future<QuerySnapshot<Map<String, dynamic>>> ckontrol(
      {required String tc,
        required String sifre}) async {
       return await FirebaseFirestore.instance
        .collection("PerUsers")
        .where("tc", isEqualTo: tc)
        .where("sifre", isEqualTo: sifre)
        .limit(1)
        .get();

  }

  Stream<List<Users>> getUsersList() {
    /// stream<QuerySnapshot> --> Stream<List<DocumentSnapshot>>
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getUsersListFromApi(_collectionPath)
        .map((querySnapshot) => querySnapshot.docs);

    ///Stream<List<DocumentSnapshot>> --> Stream<List<Users>>
    Stream<List<Users>> streamListUsers = streamListDocument.map(
            (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => Users.fromMap(docSnap.data()))
            .toList());

    return streamListUsers;
  }

}