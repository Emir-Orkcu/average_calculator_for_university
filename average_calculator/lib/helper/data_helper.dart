import 'package:average_calculator/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _tumDerslerinHarfleri(){
    return ["AA","BA","BB","CB","CC","DC","DD","FD","FF"];

  }

  static List<Ders>tumEklenenDersler=[];

  static DersEkle(Ders ders){
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla(){
    double toplamNot=0;
    double toplamKredi=0;
    tumEklenenDersler.forEach((element) {
      toplamNot=toplamNot+(element.krediDegeri*element.harfDegeri);
      toplamKredi+=element.krediDegeri;
    });
    return toplamNot/toplamKredi;
  }


  static double? _hariNotaCevir(String harf){
    switch(harf){
      case "AA":
        return 4;

      case "BA":
        return 3.5;

      case "BB":
        return 3.0;

      case "CB":
        return 2.5;

      case "CC":
        return 2;

      case "DC":
        return 1.5;

      case "DD":
        return 1.0;

      case "FD":
        return 0.5;

      case "FF":
        return 0;
    }
  }

  static List<int> _tumKrediler(){
    return List.generate(10, (index) => index+1).toList();
  }



  static List<DropdownMenuItem<double>> ?tumDerslerinHarfleri(){
    return _tumDerslerinHarfleri().map((e) => DropdownMenuItem(child: Text(e),value:_hariNotaCevir(e),)).toList();
  }

  static List<DropdownMenuItem<double>> ?tumDerslerinKredileri(){
    return _tumKrediler().map((e) => DropdownMenuItem(child:Text(e.toString()),value: e.toDouble(),)).toList();
  }
}