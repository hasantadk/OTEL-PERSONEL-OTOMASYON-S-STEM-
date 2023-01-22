import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proje/models/urunler.dart';

class Siparis {
  final String oda_no;
  final List<urun> urunler;

  Siparis(
      {required this.oda_no,
        required this.urunler});

  /// objeden map oluşturan

  Map<String, dynamic> toMap() {
    //List<SiparisInfo> ---> List<Map>
    List<Map<String, dynamic>> urunler2 =
    this.urunler.map((borrowobject) => borrowobject.toMap()).toList();

    return {
      'oda_no': oda_no,
      'urunler': urunler2,
    };
  }

  /// mapTen obje oluşturan yapıcı

  factory Siparis.fromMap(map) {
    var borrowListAsMap = map['urunler'] as List;
    List<urun> urunler2 =
    borrowListAsMap.map((object) => urun.fromMap(object)).toList();

    return Siparis(
      oda_no: map['oda_no'],
      urunler: urunler2,
    );
  }
}
