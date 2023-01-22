class Oda {
  Oda(
      {
        required this.boyut,
        required this.durum,
        required this.oda_no,});

  String boyut;
  String oda_no;
  bool durum;


  factory Oda.fromMap(map) => Oda(
    boyut: map["boyut"]?? "",
    durum: map["durum"]?? "",
    oda_no: map["oda_no"]?? "",
  );


  Map<String, dynamic> toMap() =>{
    "boyut": boyut,
    "durum": durum,
    "oda_no": oda_no,
  };

}