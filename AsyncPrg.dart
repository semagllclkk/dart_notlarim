// Asenkron programlama

// Asenkron programlama, bir işlemin tamamlanmasını beklemeden diğer işlemlere devam etme yeteneğidir.
// Dart dilinde asenkron programlama, Future ve async-await yapıları ile gerçekleştirilir.
// Future: gelecekte bir zamanda tamamlanacak bir işlemi temsil eder.
// async-await: asenkron işlemleri senkron gibi yazmamızı sağlar.
import 'dart:io';
import 'dart:math';
import 'Ogrenci.dart';

void main(List<String> args) async {
  print("Program başladı");

  // Future örneği
  Future<String> veriGetir() {
    return Future.delayed(Duration(seconds: 3), () {
      return "Veri getirildi";
    });
  }

  // async-await örneği
  void veriIsle() async {
    print("Veri işleme başladı");
    String veri = await veriGetir();
    print(veri);
    print("Veri işleme bitti");
  }

  // veriGetir fonksiyonu çağrıldığında hemen döner, 3 saniye sonra veri getirildi mesajı yazılır
  // veriIsle fonksiyonu çağrıldığında ise veriGetir fonksiyonu tamamlanana kadar bekler
  // ve ardından veri işleme bitti mesajı yazılır

  // then: Future ifadesi tamamlandığında çalışacak olan bir geri çağırma (callback) fonksiyonudur.
  veriGetir().then((veri) {
    print(veri);
  });

  // catchError, whenComplete örneği
  // catchError: Future işlemi sırasında hata oluşursa yakalar
  // whenComplete: Future işlemi tamamlandığında çalışır (başarılı veya hatalı olsun)
  Future<String> veriGetirHata() {
    return Future.delayed(Duration(seconds: 3), () {
      throw Exception("Veri getirme hatası"); // hata fırlatılır
    });
  }

  void veriIsleHata() async {
    print("Veri işleme başladı");
    String veri = await veriGetirHata()
        .catchError((hata) // hata yakalama bloğu
        {
          print("Hata yakalandı: $hata");
          return "Varsayılan veri";
        })
        .whenComplete(() {
          print(
            "Veri getirme işlemi tamamlandı",
          ); // başarılı veya hatalı olsun her zaman çalışır
        });
    print(veri);
    print("Veri işleme bitti");
  }
  // veriGetirHata fonksiyonu çağrıldığında hata oluşur ve catchError bloğu çalışır
  // ardından whenComplete bloğu çalışır ve veri işleme bitti mesajı yazılır

  //await ve async kavramları:
  // await: bir Future işleminin tamamlanmasını bekler
  // async: bir fonksiyonun asenkron olduğunu belirtir

  veriIsle();

  print("Program bitti"); // veriIsle fonksiyonu tamamlanmadan program biter
}

Future<String> veriGetir() {
  print("test edildi");
  var myFuture = Future.delayed(Duration(seconds: 3), () {
    return "Veri getirildi";
  });
  return myFuture;
}
