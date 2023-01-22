import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proje/models/PerUsers.dart';
import '../models/Oda.dart';
import '../models/Users.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Firestore servisinden kitapların verisini stream olarak alıp sağlamak

  Stream<QuerySnapshot> getUsersListFromApi(String referencePath) {
    return _firestore.collection(referencePath).snapshots();
  }

  Stream<QuerySnapshot> getIstekListFromApi(
      String referencePath, String id, String collectionPath) {
    return _firestore
        .collection(referencePath)
        .doc(id)
        .collection(collectionPath)
        .snapshots();
  }

  /// Delete burası resepsiyona eklenecek
  Future<void> deleteDocument(
      {required String referecePath, String? id}) async {
    await _firestore.collection(referecePath).doc(id).delete();
  }

  Future<void> deleteSupDocument(
      {required String referecePath,
      required String referecePath2,
      String? id,
      String? id2}) async {
    await _firestore
        .collection(referecePath)
        .doc(id)
        .collection(referecePath2)
        .doc(id2)
        .delete();
  }

  Future<void> updatedurum(
      {String? collectionPath, required PerUsers users}) async {
    await _firestore
        .collection(collectionPath!)
        .doc(users.tc)
        .set(users.toMap());
  }

  Future<void> addmus({String? collectionPath, required Users users}) async {
    await _firestore
        .collection(collectionPath!)
        .doc(users.tc)
        .set(users.toMap());
  }

  Future<void> addper({String? collectionPath, required PerUsers users}) async {
    await _firestore
        .collection(collectionPath!)
        .doc(users.tc)
        .set(users.toMap());
  }

  Future<void> odaguncelle({String? collectionPath, required Oda oda}) async {
    await _firestore
        .collection(collectionPath!)
        .doc(oda.oda_no)
        .set(oda.toMap());
  }

  Future<String> getodaid(
      {required String colpath, required String colpath2}) async {
    var a;

    await _firestore
        .collection(colpath)
        .where("oda_no", isEqualTo: colpath2)
        .limit(1)
        .get()
        .then(
          (value) => {a = value.docs[0].id},
        );
    return a;
  }

  Future<void> addT2({
    Map<String, dynamic>? Istek,
    String? colpath,
    String? colpath2,
    String? colpath3,
  }) async {
    var a;
    await _firestore
        .collection(colpath!)
        .where("alan", isEqualTo: colpath3)
        .where("durum", isEqualTo: true)
        .limit(1)
        .get()
        .then(
          (value) => {
            a = value.docs[0].id,
          },
        );
    await _firestore
        .collection(colpath)
        .doc(a)
        .collection(colpath2!)
        .add(Istek!);
  }

  Future<void> addT({
    required Map<String, dynamic> Istek,
    required String colpath,
    required String colpath2,
    required String colpath3,
  }) async {
    var a;
    var ad;
    var tc;
    var sifre;
    var alan;

    await _firestore
        .collection(colpath)
        .where("alan", isEqualTo: colpath3)
        .where("durum", isEqualTo: true)
        .limit(1)
        .get()
        .then(
          (value) => {
            a = value.docs[0].id,
            ad = value.docs[0]["ad"],
            tc = value.docs[0]["tc"],
            sifre = value.docs[0]["sifre"],
            alan = value.docs[0]["alan"]
          },
        );
    await _firestore.collection(colpath).doc(a).collection(colpath2).add(Istek);

    PerUsers peruser =
        PerUsers(ad: ad, tc: tc, sifre: sifre, alan: alan, durum: true);
    addper(collectionPath: "PerUsers", users: peruser);
  }

  Future<void> setT({
    required String path,
    Map<String, dynamic>? Istek,
    String? colpath,
    String? colpath2,
    String? colpath3,
  }) async {
    var b;
    var ad;
    var tc;
    var sifre;
    var alan;
    await _firestore
        .collection(colpath!)
        .where("alan", isEqualTo: colpath3)
        .where("durum", isEqualTo: true)
        .limit(1)
        .get()
        .then((value) => {
              b = value.docs[0].id,
              ad = value.docs[0]["ad"],
              tc = value.docs[0]["tc"],
              sifre = value.docs[0]["sifre"],
              alan = value.docs[0]["alan"]
            });
    await _firestore
        .collection(colpath)
        .doc(b)
        .collection(colpath2!)
        .doc(path)
        .set(Istek!);
    PerUsers peruser =
        PerUsers(ad: ad, tc: tc, sifre: sifre, alan: alan, durum: true);
    addper(collectionPath: "PerUsers", users: peruser);
  }
}
