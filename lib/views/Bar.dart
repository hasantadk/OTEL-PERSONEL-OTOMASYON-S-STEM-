import 'package:flutter/material.dart';
import 'package:proje/models/Siparis.dart';
import 'package:proje/models/Users.dart';
import 'package:proje/models/urunler.dart';
import 'package:provider/provider.dart';

import '../Widgets/MyDialog.dart';
import '../viewsmodels/Barmodel.dart';

class Bar extends StatefulWidget {
  final Users users;
  Bar({
    required this.users,
  });
  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  var sayac1 = 0;
  var sayac2 = 0;
  var sayac3 = 0;
  var sayac4 = 0;
  var urun1 = urun(ad: "Türk Kahvesi", fiyat: "50", adet: "0");
  var urun2 = urun(ad: "Soda", fiyat: "20", adet: "0");
  var urun3 = urun(ad: "Kola", fiyat: "25", adet: "0");
  var urun4 = urun(ad: "Bira", fiyat: "100", adet: "0");
  @override
  Widget build(BuildContext context) {
    var list = [urun1, urun2, urun3, urun4];
    return ChangeNotifierProvider<Barmodel>(
      create: (_) => Barmodel(),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color(0xFF00838f),
          centerTitle: true,
          title: Text(
            'İçecekler',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                Image.asset(
                  'images/turkkahvesi.jpg',
                  width: 140,
                  height: 100,
                ),
                Text(
                  "Türk Kahvesi",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 100,
                  color: Colors.grey[700],
                  child: Divider(
                    height: 2,
                  ),
                ),
              ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          sayac1++;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_up_rounded),
                    ),
                    Container(
                      child: Text(
                        '$sayac1',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (sayac1 > 0) {
                            sayac1--;
                          }
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                    ),
                  ]),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "images/soda.jpg",
                  width: 140,
                  height: 100,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Soda",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 100,
                  color: Colors.grey[700],
                  child: Divider(
                    height: 2,
                  ),
                ),
              ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          sayac2++;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_up_rounded),
                    ),
                    Container(
                      child: Text(
                        '$sayac2',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (sayac2 > 0) {
                              sayac2--;
                            }
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_down_rounded))
                  ]),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'images/cola.jpg',
                  width: 140,
                  height: 100,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Coca-Cola",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 100,
                  color: Colors.grey[700],
                  child: Divider(
                    height: 2,
                  ),
                ),
              ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          sayac3++;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_up_rounded),
                    ),
                    Container(
                      child: Text(
                        '$sayac3',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (sayac3 > 0) {
                              sayac3--;
                            }
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_down_rounded))
                  ]),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'images/bira.jpg',
                  width: 140,
                  height: 100,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Bira",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 100,
                  color: Colors.grey[700],
                  child: Divider(
                    height: 2,
                  ),
                ),
              ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          sayac4++;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_up_rounded),
                    ),
                    Container(
                      child: Text('$sayac4',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (sayac4 > 0) {
                              sayac4--;
                            }
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_down_rounded))
                  ]),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              SizedBox(
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (sayac1 == 0 &&
                        sayac2 == 0 &&
                        sayac3 == 0 &&
                        sayac4 == 0) {
                      await MyDialog()
                          .showMyDialog(context, "Hata", "Lütfen Ürün Seçiniz");
                    } else {
                      list[0].adet = sayac1.toString();
                      list[1].adet = sayac2.toString();
                      list[2].adet = sayac3.toString();
                      list[3].adet = sayac4.toString();
                      var i = 0;
                      while (i < 3) {
                        list[i].fiyat = context
                            .read<Barmodel>()
                            .hesapla(adet: list[i].adet, fiyat: list[i].fiyat);
                        i++;
                      }
                      var siparis =
                          Siparis(oda_no: widget.users.oda_no, urunler: list);
                      await Provider.of<Barmodel>(context, listen: false)
                          .addtemiz(tem: siparis);
                      await MyDialog().showMyDialog(
                          context, "Siparişiniz Alındı", "Hazırlanıyor");
                    }
                  },
                  child: Text('Sipariş Ver'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF00838f))),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
