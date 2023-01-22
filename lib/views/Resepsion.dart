import 'package:flutter/material.dart';
import 'package:proje/views/Musteriekle.dart';
import 'package:provider/provider.dart';

import '../models/Oda.dart';
import '../models/PerUsers.dart';
import '../viewsmodels/Resepsionmodel.dart';

class Resepsion extends StatefulWidget {
  final PerUsers perUsers;
  Resepsion({
    required this.perUsers,
  });

  @override
  State<Resepsion> createState() => _ResepsionState();
}

class _ResepsionState extends State<Resepsion> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Resepsionmodel>(
      create: (_) => Resepsionmodel(),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
          title: Text('Odalar'),
          toolbarHeight: 80,
          backgroundColor: Color(0xFF00838f),
        ),
        body: Center(
          child: Column(
            children: [
              StreamBuilder<List<Oda>>(
                stream: Provider.of<Resepsionmodel>(context, listen: false)
                    .getOdaList(),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasError) {
                    print(asyncSnapshot.error);
                    return Center(
                        child: Text(
                            'Bir Hata Oluştu, daha sonra tekrar deneyiniz'));
                  } else {
                    if (!asyncSnapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      List<Oda> Odalist = asyncSnapshot.data!;
                      return OdaListView(
                          Odalist: Odalist,
                          perUser: widget.perUsers); //, key: null,
                    }
                  }
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class OdaListView extends StatefulWidget {
  const OdaListView({
    super.key,
    required this.Odalist,
    required this.perUser,
  });
  final PerUsers perUser;
  final List<Oda> Odalist;

  @override
  _OdaListViewState createState() => _OdaListViewState();
}

class _OdaListViewState extends State<OdaListView> {
  @override
  Widget build(BuildContext context) {
    var list = widget.Odalist;
    return Flexible(
      child: Column(
        children: [
          Flexible(
            child: Container(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    var color = Colors.green;
                    var durum = "Boş";
                    if (list[index].durum == false) {
                      color = Colors.red;
                      durum = "Dolu";
                    }
                    if (durum == "Boş") {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Musteriekle(
                                        oda: list[index],
                                      )));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Oda: " +
                                list[index].oda_no +
                                " Kapasite :" +
                                list[index].boyut,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      );
                    } else {
                      return InkWell(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                    child: ListTile(
                                      title: Text("Müşteriyi Sil"),
                                      onTap: () async {
                                        await context
                                            .read<Resepsionmodel>()
                                            .musremove(oda: list[index]);
                                        await context
                                            .read<Resepsionmodel>()
                                            .odaguncel(list[index]);

                                        //Provider.of<Resepsionmodel>(context,
                                        //  listen: false)
                                        //.musremove( oda: list[index]);
                                      },
                                    ),
                                  ));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Oda: " +
                                list[index].oda_no +
                                " Kapasite: " +
                                list[index].boyut,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
