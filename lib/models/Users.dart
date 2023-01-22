class Users {
  Users(
      {
        required this.ad,
        required this.tc,
        required this.sifre,
        required this.oda_no});

  String ad;
  String tc;
  String sifre;
  String oda_no;

  factory Users.fromMap(map) => Users(
      ad: map["ad"],
      tc: map["tc"],
      sifre: map["sifre"],
      oda_no: map["oda_no"]);


    Map<String, dynamic> toMap() =>{
      "ad": ad,
      "tc": tc,
      "sifre": sifre,
      "oda_no": oda_no,
    };

}