import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/Istek.dart';
import '../models/PerUsers.dart';
import '../viewsmodels/Temizlikcimodel.dart';

class Temizlikci extends StatefulWidget {
  final PerUsers perUsers;
  Temizlikci({
    required this.perUsers,
  });

  @override
  State<Temizlikci> createState() => _TemizlikciState();
}

class _TemizlikciState extends State<Temizlikci> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Temizlikcimodel>(
      create: (_) => Temizlikcimodel(),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
          title: Text('Temizlik istekleri   Çalışan: ${widget.perUsers.ad}'),
          toolbarHeight: 80,
          backgroundColor: Color(0xFF00838f),
        ),
        body: Center(
          child: Column(
            children: [
              StreamBuilder<List<Istek>>(
                stream: Provider.of<Temizlikcimodel>(context, listen: false)
                    .getIstekList(widget.perUsers),
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
                      List<Istek> Isteklist = asyncSnapshot.data!;
                      return IstekListView(
                          Isteklist: Isteklist,
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

class IstekListView extends StatefulWidget {
  const IstekListView({
    super.key,
    required this.Isteklist,
    required this.perUser,
  });
  final PerUsers perUser;
  final List<Istek> Isteklist;

  @override
  _IstekListViewState createState() => _IstekListViewState();
}

class _IstekListViewState extends State<IstekListView> {
  @override
  Widget build(BuildContext context) {
    var list = widget.Isteklist;
    return Flexible(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    child: Card(
                      child: ListTile(
                        title: Text("Oda : " + list[index].oda_no),
                        subtitle: Text(list[index].istek),
                      ),
                    ),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) async {
                            widget.perUser.durum == true;
                            await Provider.of<Temizlikcimodel>(context,
                                    listen: false)
                                .temizlikonay(list[index], widget.perUser);
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
