import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje/Services/database.dart';
import 'package:proje/models/Istek.dart';

class Musterimodel extends ChangeNotifier{
  Database _database =Database();
   String colpath="PerUsers";
   String colpath2="Servis_istek";
   String colpath3="Temizlikci";
  Future<void>  addistek({required Istek Istek})async {
    await _database.addT(Istek: Istek.toMap(),colpath:colpath ,colpath2: colpath2,colpath3: colpath3);
  }
  Future<void>  addtemiz({required Istek tem})async {
    await _database.setT(path:tem.oda_no,Istek: tem.toMap(),colpath:colpath ,colpath2: colpath2,colpath3: colpath3);
  }
}