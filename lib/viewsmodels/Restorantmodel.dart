import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Services/database.dart';
import '../models/Siparis.dart';
class Restorantmodel extends ChangeNotifier {
  Database _database = Database();
  String _collectionPath = 'PerUsers';
  String _colpath2 = "YemekSiparis";
  String _colpath3 = "Asci";

  Future<void>  addtemiz({required Siparis tem})async {
    await _database.addT2(Istek: tem.toMap(),colpath:_collectionPath ,colpath2: _colpath2,colpath3: _colpath3);
  }
  String hesapla(
      {required var adet,required var fiyat}
      ){
    int a=int.parse(fiyat);
    int b=int.parse(adet);
    int c=a*b;
    return c.toString();

  }
}