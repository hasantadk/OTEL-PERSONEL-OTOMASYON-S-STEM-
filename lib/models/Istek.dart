class Istek {
  Istek(
      {
        required this.istek,
        required this.oda_no,});

  String istek;
  String oda_no;


  factory Istek.fromMap(map) => Istek(
      istek: map["istek"]?? "",
      oda_no: map["oda_no"]?? "",
  );


  Map<String, dynamic> toMap() =>{
    "istek": istek,
    "oda_no": oda_no,
  };

}