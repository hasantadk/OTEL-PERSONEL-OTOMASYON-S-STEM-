import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/MyDialog.dart';
import '../models/PerUsers.dart';
import '../viewsmodels/Insankaynaklarimodel.dart';

class Insankaynaklari extends StatefulWidget {
  final PerUsers perUsers;
  Insankaynaklari({
    required this.perUsers,
  });
  @override
  State<Insankaynaklari> createState() => _InsankaynaklariState();
}

class _InsankaynaklariState extends State<Insankaynaklari> {
  bool _passwordVisible = false;
  void gizle() {
    if (_passwordVisible == true) {
      _passwordVisible = false;
    } else {
      _passwordVisible = true;
    }
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("İnsan Kaynakları"), value: "Insankaynaklari"),
      DropdownMenuItem(child: Text("Resepsiyon"), value: "Resepsion"),
      DropdownMenuItem(child: Text("Oda Servisi"), value: "Odaservisi"),
      DropdownMenuItem(child: Text("Aşçı"), value: "Asci"),
      DropdownMenuItem(child: Text("Barmen"), value: "Barmen"),
      DropdownMenuItem(child: Text("Temizlik Görevlisi"), value: "Temizlikci"),
    ];
    return menuItems;
  }

  String selectedValue = "Insankaynaklari";
  @override
  Widget build(BuildContext context) {
    final TextEditingController adCtrl = TextEditingController();
    final TextEditingController tcCtrl = TextEditingController();
    final TextEditingController sifreCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFF00838f),
        centerTitle: true,
        title: Text(
          'Personel Kayıt',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ChangeNotifierProvider<Insankaynaklarimodel>(
          create: (_) => Insankaynaklarimodel(),
          builder: (context, child) => SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 400,
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          controller: adCtrl,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'İsim / Soyisim',
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
                          controller: tcCtrl,
                          decoration: InputDecoration(
                            labelText: 'T.C. Kimlik NO',
                            suffixIcon: Icon(Icons.account_circle_outlined,
                            size: 17,),
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
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownButton(
                                iconEnabledColor: Colors.black,
                                value: selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                },
                                items: dropdownItems,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () async {
                                  var kontrol=await context.read<Insankaynaklarimodel>().kontrol(tc: tcCtrl.text);
                                  if(kontrol.docs.isNotEmpty){
                                    await MyDialog().showMyDialog(
                                        context, "Hata", "Bu T.C. ile kayıtlı kullanıcı var");
                                  }else{
                                    var user = PerUsers(
                                        ad: adCtrl.text,
                                        tc: tcCtrl.text,
                                        sifre: sifreCtrl.text,
                                        alan: selectedValue,
                                        durum:true);
                                    await Provider.of<Insankaynaklarimodel>(context,
                                        listen: false)
                                        .perekle(user);
                                    await MyDialog().showMyDialog(
                                        context, "Tebrikler", "Kayıt başarıyla oluşturuldu");
                                    }
                                },
                                child: Text('Kaydet'),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blueGrey[900])),
                              ),
                            ],
                          ),
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
