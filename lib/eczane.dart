class Eczane {
  String eczaneAdi;
  String eczaneIlce;
  String eczaneAdres;
  String eczaneTelefon;
  String eczaneIl;

  Eczane(
      {this.eczaneAdi,
      this.eczaneIlce,
      this.eczaneAdres,
      this.eczaneTelefon,
      this.eczaneIl});

  Eczane.fromJson(Map<String, dynamic> json) {
    eczaneAdi = json['eczane_adi'];
    eczaneIlce = json['eczane_ilce'];
    eczaneAdres = json['eczane_adres'];
    eczaneTelefon = json['eczane_telefon'];
    eczaneIl = json['eczane_il'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eczane_adi'] = this.eczaneAdi;
    data['eczane_ilce'] = this.eczaneIlce;
    data['eczane_adres'] = this.eczaneAdres;
    data['eczane_telefon'] = this.eczaneTelefon;
    data['eczane_il'] = this.eczaneIl;
    return data;
  }
}
