import 'package:average_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),theme: ThemeData(brightness: Brightness.light),debugShowCheckedModeBanner:false ,));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrtalamaHesaplaApp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/splashscreen.jpg"),
                fit: BoxFit.cover)),
      ),
    );
  }
}