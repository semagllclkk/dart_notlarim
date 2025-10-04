import 'dart:io';
import 'dart:math';
import 'Ogrenci.dart';


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

  // lambda fonksiyon: isimsiz fonksiyonlardır
  Function fonksiyon = (int a, b) {
    return a + b;
  }; //(20, 30);
  //1. kullanım:

  //2. kullanım:
  fonksiyon(10, 20);

  // lambda fonksiyonlar 2 farklı şekilde tanımlanabilir
  // 1. fat arrow fonksiyon
  var f2 = (int a, int b) => print(a + b);
  // 2. normal fonksiyon
  var f3 = (int a, int b) {
    print(a + b);
  };

  Ogrenci ogrenci1 = Ogrenci(1, "Sema Gül", "Çelik", 18, "Lisans-3");
  print(ogrenci1.bilgileriGetir());

  // null safety: null safety, null değerlerin neden olduğu hataları önlemek için kullanılır
  // null safety, değişkenlerin null değer alıp almayacağını belirlemek için kullanılır
  List <String?> isim = []; // içindeki değer/değerler null olabilir
  List? <String> isim2 = null; // liste null olabilir
  List <String?>? isim3 = []; // liste ve içindeki değer/değerler null olabilir

  // !: null check operatörüdür, değişkenin null olmadığını garanti eder
  // örneğin null olabilecek bir değerin asıl değerinin null olmadığını garanti etmek için kullanılır
  String? isim4 = "isim";
  //print(isim4.length); // hata verir, çünkü isim4 null olabilir
  print(isim4!.length); // hata vermez, çünkü isim4 null olamaz. isim4'ün null olmadığını garanti ettik


// map ve list sınıflarına ait fonksiyonları Dart dokümanından daha detaylı inceleyebiliriz, o yüzden burada kullanmadım.

// required parametreli fonksiyon
// required parametreli fonksiyonlarda tüm parametreler çağırılırken verilmelidir
// required: fonksiyonun parametrelerinde keyword olarak kullanılır
int toplam({required int a, required int b}) {
  return a + b;

}
// örnek kullanım:
print(toplam(a: 6, b: 9));


// type promotion: değişkenin tipini kontrol edip, o tipe göre işlem yapma
// null olabilecek tiplere non-nullable gibi davranır
// örnek:
String? mesaj;
if ( DateTime.now().hour < 12) {
  mesaj = "Günaydın";
} else {
  mesaj = "İyi akşamlar";
}
print(mesaj.length); // hata vermez, çünkü mesaj null olamaz, bunu yukarıda garanti ettik.
// şayet else bloğu olmasaydı, mesaj null olabilirdi ve hata verirdi.

//late: geç başlatma için kullanılır
// değişkenin null olamayacağını ama başlangıçta değer ataması yapılmayacağını, daha sonra atanacağını garanti eder
late String sehir;
sehir = "Ankara";
print(sehir);
// hata vermez, çünkü sehir değişkeninin null olamayacağını ve daha sonra atanacağını garanti ettik.

//??: null coalescing operatörüdür
// değişken null ise sağdaki değeri atar
String? isim5;
String isim6 = isim5 ?? "İsimsiz";
print(isim6); // isim5 null olduğu için isim6'ya "İsimsiz" atanır
// eğer isim5 null olmasaydı, isim6'ya isim5'in değeri atanırdı

//?. : null değilse operatörüdür
// eğer ifade null değilse ifadenin değerive işlemler, null ise null döner


// try-catch: hata yakalama bloğudur
//şu şekilde kullanılır:

// try, on (opsiyonel), catch ve finally (opsiyonel) bloklarından oluşur

// try bloğunda hata oluşabilecek kodlar yazılır

// on bloğunda spesifik hata türleri yakalanabilir, on bloğu çalışırak catch bloğu çalışmaz
// on HataTürü catch (e) { ... } şeklinde kullanılır

// catch bloğunda tüm hata türleri yakalanabilir

// finally bloğu her durumda çalışır, hata olsa da olmasa da çalışır.

// throw: hata fırlatma işlemi yapar
// throw ile özel hata mesajları oluşturulabilir

// rethrow: yakalanan hatayı tekrar fırlatır
// catch bloğunda kullanılır
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

// generic fonksiyon
double ortalamaHesapla<T extends num>(T a, T b) {
  return (a + b)/2;
}
// T extends num: T tipi num tipinden türemiş bir tip olmalıdır
// num: int ve double tiplerinin üst sınıfıdır

// db, dosya okuma ve logger kısımlarını eklemedim.
// asenkron programlamanın tamamını da eklemedim.