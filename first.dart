import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  int kenar1 = 3;
  int kenar2 = 4;
  int kenar3 = 5;

  int cevre = kenar1 + kenar2 + kenar3;
  print(
    "birinci kenarı $kenar1 ikinci kenarı $kenar2 üçüncü kenarı $kenar3 olan Üçgenin çevresi: $cevre",
  );

  String ad = "Sema Gül";
  String soyad = "Çelik";
  num dogum_yili = 2005;

  print("Ben $ad $soyad ve $dogum_yili yılında doğdum.");

  //faktöriyel hesaplama örneği
  int sayi = 5;
  int i = 1;
  int carpim = 1;
  while (i <= sayi) {
    carpim = carpim * i;
    i++;
  }
  print(carpim);

  // list: sabit uzunlukta liste tanımlama
  // listelerde index ile erişim sağlanabilir
  List<int> sayilar = [1, 2, 3, 4, 5]; // liste tanımlama
  print(sayilar[2]); // index ile liste elemanına erişim

  // değişken uzunlukta liste tanımlama
  List<int> degiskenSayilar = List.filled(5, 0, growable: true);
  degiskenSayilar[0] = 10; // index ile liste elemanına erişim

  List<int> temp = []; // dinamik liste tanımlama
  // bu liste tipine index ile erişim sağlanamaz
  temp.add(1); // listeye eleman ekleme

  //set: benzersiz elemanlardan oluşan bir veri yapısıdır
  // aynı eleman birden fazla kez eklenemez
  // elemanların sıralaması yoktur
  // index ile erişim sağlanamaz

  Set<int> baskaSayilar = Set();
  baskaSayilar.add(5);
  baskaSayilar.add(6);
  baskaSayilar.add(5);
  baskaSayilar.add(9);
  baskaSayilar.add(6);
  baskaSayilar.add(7);

  //örnek-1
  List<int> sayiListesi = [];
  for (int i = 0; i < 100; i++) {
    sayiListesi.add(Random().nextInt(101));
    i++;
  }
  print(sayiListesi);

  // map: key-value çiftlerinden oluşan bir veri yapısıdır
  // örnek-2
  Map<String, dynamic> ogrenci = {
    "ad": "sema gül",
    "soyad": "çelik",
    "dogum_yili": 2005,
  };

  for (var item in ogrenci.entries) {
    print("${item.key}: ${item.value}");
  } // map elemanlarına erişim, entries ile key-value çiftlerine erişilir.

  //örnek-3
  List<int> pozitifSayilar = [];
  do {
    print("Bir pozitif sayı giriniz: ");

    //stdin: standart input
    //readLineSync(): kullanıcıdan input almak için kullanılır
    // return tipi String? (nullable String) dir
    // veriyi aldıktan sonra parse etmek gerekir
    String? input = stdin.readLineSync();

    int sayi = int.parse(input!);
    if (sayi != -1) {
      if (sayi >= 0) {
        pozitifSayilar.add(sayi);
        print("Pozitif sayılar: $pozitifSayilar");
      }
    } else {
      print("Çıkış yapılıyor...");
      break;
    }
  } while (sayi != -1);
}

int hacimhesapla(int a, int b, int c) {
  int hacim = a * b * c;
  return hacim;
}

// fat arrow function
// tek satırlık fonksiyonlarda kullanılır
int hacimhesapla2(int a, int b, int c) => a * b * c;

// optional parametreli fonksiyon
int topla(int a, int b, [int c = 0]) => a + b + c;

// named parametreli fonksiyon
int topla2(int a, int b, {int c = 0}) => a + b + c;
// süslü parantez içindeki parametreler named parametrelerdir
// named parametreler çağırılırken parametre ismi ile çağrılır
// named parametreler opsiyoneldir
// named parametreler default değer alabilir
// named parametreler sıralı olmak zorunda değildir, istediğimiz sırada çağırabiliriz
// named parametreler opsiyonel olduğu için çağırılmazsa default (null) değeri alır
