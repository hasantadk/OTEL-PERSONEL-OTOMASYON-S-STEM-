import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/PerUsers.dart';
import '../models/Users.dart';
import '../viewsmodels/LoginPagemodel.dart';
import 'Asci.dart';
import 'Barmen.dart';
import 'Insankaynaklari.dart';
import 'Musteri.dart';
import 'Odaservisi.dart';
import 'Resepsion.dart';
import 'Temizlici.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController tcCtrl = TextEditingController();
  final TextEditingController sifreCtrl = TextEditingController();
  bool _passwordVisible = false;
  void gizle() {
    if (_passwordVisible == true) {
      _passwordVisible = false;
    } else {
      _passwordVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<LoginPagemodel>(
        create: (_) => LoginPagemodel(),
        builder: (context, child) => SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.2, -0.2),
                end: Alignment(0.4, 0.1),
                colors: [
                  Color(0xFF90A4AE),
                  Color(0xFF00acc1),
                  Color(0xFF90A4AE),
                  Color(0xFF00acc1),
                  Color(0xFF80deea),
                  Color(0xFF00acc1),
                  Color(0xFF90A4AE),
                  Color(0xFF00acc1),
                  Color(0xFF80deea),
                  Color(0xFF00acc1),
                  Color(0xFF90A4AE),
                  Color(0xFF00acc1),
                  Color(0xFF80deea),
                  Color(0xFF00acc1),
                  Color(0xFF90A4AE),
                  Color(0xFF00acc1),
                  Color(0xFF90A4AE),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('images/logo.jpg'),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'BHC OTEL',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 380,
                  width: 325,
                  decoration: BoxDecoration(
                    color: Color(0xFF00838f),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Hoşgeldiniz',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          controller: tcCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'T.C. Kimlik NO',
                            suffixIcon: Icon(
                              Icons.account_circle_outlined,
                              size: 17,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          controller: sifreCtrl,
                          keyboardType: TextInputType.number,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                              labelText: 'Sifre',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 17,
                                  color: Colors.grey[900],
                                ),
                                onPressed: () {
                                  setState(() {
                                    gizle();
                                  });
                                },
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                var response = await context
                                    .read<LoginPagemodel>()
                                    .kontrol(
                                        tc: tcCtrl.text, sifre: sifreCtrl.text);
                                var response3 = await context
                                    .read<LoginPagemodel>()
                                    .ckontrol(
                                        tc: tcCtrl.text, sifre: sifreCtrl.text);
                                if (response.docs.isNotEmpty) {
                                  Users users = Users(
                                      ad: response.docs[0]["ad"],
                                      tc: response.docs[0]["tc"],
                                      sifre: response.docs[0]["sifre"],
                                      oda_no: response.docs[0]["oda_no"]);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Musteri(users: users)));
                                } else if (response3.docs.isNotEmpty) {
                                  PerUsers perusers = PerUsers(
                                      ad: response3.docs[0]["ad"],
                                      tc: response3.docs[0]["tc"],
                                      sifre: response3.docs[0]["sifre"],
                                      alan: response3.docs[0]["alan"],
                                      durum: response3.docs[0]["durum"]);
                                  String alan = response3.docs[0]["alan"];
                                  if (alan == "InsanKaynaklari") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Insankaynaklari(
                                                    perUsers: perusers)));
                                  } else if (alan == "Resepsion") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Resepsion(perUsers: perusers)));
                                  } else if (alan == "Odaservisi") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Odaservisi(
                                                perUsers: perusers)));
                                  } else if (alan == "Temizlikci") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Temizlikci(
                                                perUsers: perusers)));
                                  } else if (alan == "Barmen") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Barmen(perUsers: perusers)));
                                  } else if (alan == "Asci") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Asci(perUsers: perusers)));
                                  }
                                }
                              },
                              child: Text('Giriş'),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueGrey[900])),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
