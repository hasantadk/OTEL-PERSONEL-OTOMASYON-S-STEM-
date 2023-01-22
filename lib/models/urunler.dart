import 'package:cloud_firestore/cloud_firestore.dart';

class urun {
  String ad;
  String fiyat;
  String adet;

  urun(
      {required this.ad,
        required this.fiyat,
        required this.adet,});

  /// objeden map oluşturan

  Map<String, dynamic> toMap() => {
    'ad': ad,
    'fiyat': fiyat,
    'adet': adet,
  };

  //mapten obje oluşturma

  factory urun.fromMap(map) => urun(
    ad: map['ad'] ?? "",
    fiyat: map['fiyat'] ?? "",
    adet: map['adet'] ?? "",
  );
}
