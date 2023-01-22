import 'package:flutter/material.dart';
import 'package:proje/Widgets/MyDialog.dart';
import 'package:proje/models/Users.dart';
import 'package:provider/provider.dart';
import '../models/Oda.dart';
import '../viewsmodels/Musterieklemodel.dart';
import '../widgets/my_elevated_button.dart';

class Musteriekle extends StatelessWidget {
  Musteriekle({
    super.key,
    required this.oda,
  });
  Oda oda;
  final TextEditingController tcCtrl = TextEditingController();
  final TextEditingController sifreCtrl = TextEditingController();
  final TextEditingController adCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        title: Text("Yeni Müşteri Kayıt"),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color(0xFF00838f),
      ),
      body: ChangeNotifierProvider(
        create: (_) => Musterieklemodel(),
        builder: (context, child) => SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                    label: Text("Ad ve Soyad"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                controller: adCtrl,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                    label: Text("T.C. Kimlik No"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                controller: tcCtrl,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                    label: Text("Şifre"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                controller: sifreCtrl,
                obscureText: true,
              ),
            ),
            MyElevatedButton(
                color: Colors.red,
                onPressed: () async {
                  var kontrol = await context
                      .read<Musterieklemodel>()
                      .kontrol(tc: tcCtrl.text);
                  if (kontrol.docs.isNotEmpty) {
                    await MyDialog().showMyDialog(
                        context, "Hata", "Bu T.C. ile kayıtlı kullanıcı var");
                  } else {
                    var user = Users(
                        ad: adCtrl.text,
                        tc: tcCtrl.text,
                        sifre: sifreCtrl.text,
                        oda_no: oda.oda_no);
                    await Provider.of<Musterieklemodel>(context, listen: false)
                        .musekle(user);
                    await Provider.of<Musterieklemodel>(context, listen: false)
                        .odaguncelle(oda);
                    await MyDialog().showMyDialog(
                        context, "Tebrikler", "Kayıt başarıyla oluşturuldu");
                    Navigator.pop(context);
                  }
                },
                child: const Text("Müşteri Ekle"))
          ]),
        ),
      ),
    );
  }
}
