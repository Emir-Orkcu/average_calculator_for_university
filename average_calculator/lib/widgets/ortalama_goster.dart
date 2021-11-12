import 'package:average_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  const OrtalamaGoster({ required this.dersSayisi,required this.ortalama, Key? key }) : super(key: key);
  final double ortalama;
  final int dersSayisi;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders Girildi" : "Ders Seçiniz",
          style: Sabitler.dersSayisiStyle,
        ),
        Text(
          ortalama >=0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
          style: Sabitler.OrtalamaSayisi,
        ),
        Text(
          "Ortalama",
          style: Sabitler.OrtalamaYazisi,
        ),

      ],
    );
  }
}