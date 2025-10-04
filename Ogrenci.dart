class Ogrenci {
  int id;
  String ad;
  String soyad;
  int yas;
  String sinif;

Ogrenci(int id, String ad, String soyad, int yas, String sinif){
      this.id = id;
      this.ad = ad;
      this.soyad = soyad;
      this.yas = yas;
      this.sinif = sinif;}
      
  String bilgileriGetir() {
    return "ID: $id, Ad: $ad, Soyad: $soyad, Yaş: $yas, Sınıf: $sinif";

}
