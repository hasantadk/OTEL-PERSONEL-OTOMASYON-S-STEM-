import 'package:flutter/material.dart';
import 'package:proje/Widgets/MyDialog.dart';
import 'package:proje/Widgets/my_elevated_button.dart';
import 'package:proje/models/Istek.dart';
import 'package:proje/models/Users.dart';
import 'package:proje/views/Restorant.dart';
import 'package:provider/provider.dart';
import '../viewsmodels/Musterimodel.dart';
import 'Bar.dart';

class Musteri extends StatelessWidget {
  final Users users;
  Musteri({
    required this.users,
  });
  @override
  Widget build(BuildContext context) {
    Istek istek = Istek(istek: "Temizlik", oda_no: users.oda_no);
    return ChangeNotifierProvider<Musterimodel>(
      create: (context) => Musterimodel(),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color(0xFF00838f),
          title: Text(" Oda : ${users.oda_no}"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'images/icecekler.jpg',
                  width: 300,
                  height: 300,
                ),
                MyElevatedButton(
                    child: Text(
                      "İçecekler",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xFF00838f),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bar(users: users)));
                    }),
                Image.asset(
                  'images/yemek.jpg',
                  width: 300,
                  height: 300,
                ),
                MyElevatedButton(
                    child: Text(
                      "Yemekler",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xFF00838f),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Restorant(
                                    users: users,
                                  )));
                    }),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                Image.asset(
                  'images/temizlikci.jpg',
                  width: 300,
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyElevatedButton(
                      child: Text(
                        "Temizlik",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xFF00838f),
                      onPressed: () async {
                        await context.read<Musterimodel>().addtemiz(tem: istek);
                        await MyDialog().showMyDialog(
                            context, "Onaylandı", "Temizlik Talebiniz alındı");
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
