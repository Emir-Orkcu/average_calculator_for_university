import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Sabitler{
  static const anaRenk= Colors.indigo;
  static const String baslikText="Ortalama Hesapla";
  static final TextStyle appbarBaslikRenk=GoogleFonts.quicksand(
    fontSize: 24,fontWeight: FontWeight.w900,color: anaRenk
  );

  static BorderRadius borderRadius=BorderRadius.circular(12);

  static final TextStyle dersSayisiStyle=GoogleFonts.quicksand(
    fontSize: 16,fontWeight: FontWeight.w700,color: anaRenk
  ); 

  static final TextStyle OrtalamaSayisi=GoogleFonts.quicksand(
    fontSize: 55,fontWeight: FontWeight.w900,color: anaRenk
  ); 

  static final TextStyle OrtalamaYazisi=GoogleFonts.quicksand(
    fontSize: 16,fontWeight: FontWeight.w700,color: anaRenk
  ); 
}