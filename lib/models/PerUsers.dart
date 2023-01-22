class PerUsers {
  PerUsers(
      {
        required this.ad,
        required this.tc,
        required this.sifre,
        required this.alan,
        this.durum = true});

  String ad;
  String tc;
  String sifre;
  String alan;
  bool durum;

  factory PerUsers.fromMap(map) => PerUsers(
      ad: map["ad"],
      tc: map["tc"],
      sifre: map["sifre"],
      alan: map["alan"],
      durum: map["durum"]);


  Map<String, dynamic> toMap() =>{
    "ad": ad,
    "tc": tc,
    "sifre": sifre,
    "alan": alan,
    "durum": durum
  };

}