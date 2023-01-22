import 'package:flutter/material.dart';
import 'package:proje/models/Siparis.dart';
import 'package:proje/models/Users.dart';
import 'package:proje/models/urunler.dart';
import 'package:provider/provider.dart';
import '../Widgets/MyDialog.dart';
import '../viewsmodels/Restorantmodel.dart';


class Restorant extends StatefulWidget {
  final Users users;
  Restorant({
    required this.users,
  });
  @override
  State<Restorant> createState() => _RestorantState();
}

class _RestorantState extends State<Restorant> {
  var sayac1 = 0;
  var sayac2 = 0;
  var sayac3 = 0;
  var sayac4 = 0;
  var sayac5=0;
  var urun1 = urun(ad: "Hamburger", fiyat: "80", adet: "0");
  var urun2 = urun(ad: "Pizza", fiyat: "100", adet: "0");
  var urun3 = urun(ad: "Köri Soslu Tavuk", fiyat: "75", adet: "0");
  var urun4 = urun(ad: "Lahmacun", fiyat: "40", adet: "0");
  var urun5 = urun(ad: "Pide", fiyat: "70", adet: "0");
  @override
  Widget build(BuildContext context) {
    var list = [urun1, urun2, urun3, urun4,urun5];
    return ChangeNotifierProvider<Restorantmodel>(
      create: (_) => Restorantmodel(),
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
                  'images/hamburger.jpg',
                  width: 140,
                  height: 100,
                ),
                Text(
                  "Hamburger",
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
                Image.asset(
                  'images/pizza.jpg',
                  width: 140,
                  height: 100,
                ),
                Text(
                  "Pizza",
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
                  "images/kori.jpg",
                  width: 140,
                  height: 100,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Köri Soslu Tavuk",
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
                            if (sayac3> 0) {
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
                  'images/lahmacun.jpg',
                  width: 140,
                  height: 100,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Lahmacun",
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
                      child: Text(
                        '$sayac4',
                        style: Theme.of(context).textTheme.headline4,
                      ),
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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'images/pide.jpg',
                  width: 140,
                  height: 100,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Pide",
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
                          sayac5++;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_up_rounded),
                    ),
                    Container(
                      child: Text('$sayac5',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (sayac5 > 0) {
                              sayac5--;
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
                        sayac4 == 0 &&
                        sayac5==0) {
                      await MyDialog()
                          .showMyDialog(context, "Hata", "Lütfen Ürün Seçiniz");
                    } else {
                      list[0].adet=sayac1.toString();
                      list[1].adet=sayac2.toString();
                      list[2].adet=sayac3.toString();
                      list[3].adet=sayac4.toString();
                      list[4].adet=sayac5.toString();
                      var i=0;
                      while(i<4){
                        list[i].fiyat= context.read<Restorantmodel>().hesapla(adet: list[i].adet, fiyat: list[i].fiyat);
                        i++;
                      }
                      var siparis =
                      Siparis(oda_no: widget.users.oda_no, urunler: list);
                      await Provider.of<Restorantmodel>(context, listen: false)
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
