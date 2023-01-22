import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/PerUsers.dart';
import '../models/Siparis.dart';
import '../viewsmodels/Odaservisimodel.dart';

class Odaservisi extends StatefulWidget {
  final PerUsers perUsers;
  Odaservisi({
    required this.perUsers,
  });

  @override
  State<Odaservisi> createState() => _OdaservisiState();
}

class _OdaservisiState extends State<Odaservisi> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Odaservisimodel>(
      create: (_) => Odaservisimodel(),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
          title: Text('İçecek Siparişler'),
          toolbarHeight: 80,
          backgroundColor: Color(0xFF00838f),
        ),
        body: Center(
          child: Column(
            children: [
              StreamBuilder<List<Siparis>>(
                stream: Provider.of<Odaservisimodel>(context, listen: false)
                    .getSiparisList(widget.perUsers),
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
                      List<Siparis> Siparislist = asyncSnapshot.data!;
                      return SiparisListView(
                          Siparislist: Siparislist,
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

class SiparisListView extends StatefulWidget {
  const SiparisListView({
    super.key,
    required this.Siparislist,
    required this.perUser,
  });
  final PerUsers perUser;
  final List<Siparis> Siparislist;

  @override
  _SiparisListViewState createState() => _SiparisListViewState();
}

class _SiparisListViewState extends State<SiparisListView> {
  @override
  Widget build(BuildContext context) {
    var list = widget.Siparislist;
    return Flexible(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var listurun = list[index].urunler;
                  return Slidable(
                    child: Card(
                      child: ListTile(
                        title: Text("Oda : " + list[index].oda_no),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                child: Flexible(
                              child: Column(
                                children: [
                                  Flexible(
                                    child: ListView.builder(
                                        itemCount: listurun.length,
                                        itemBuilder: (context, index2) {
                                          return Card(
                                            child: ListTile(
                                              title: Text(
                                                  "${listurun[index2].ad}"),
                                              subtitle: Text(
                                                  "Adet : ${listurun[index2].adet}  Fiyat : ${listurun[index2].fiyat}"),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            )),
                          );
                        },
                      ),
                    ),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) async {
                            widget.perUser.durum == true;
                            await Provider.of<Odaservisimodel>(context,
                                    listen: false)
                                .odaservisi_gel(list[index], widget.perUser);
                          },
                          backgroundColor: Colors.greenAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.check,
                          label: 'Onayla',
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
