import 'package:average_calculator/constants/app_constants.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:average_calculator/model/ders.dart';
import 'package:average_calculator/widgets/ders_listesi.dart';
import 'package:average_calculator/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaApp extends StatefulWidget {
  const OrtalamaHesaplaApp({ Key? key }) : super(key: key);

  @override
  _OrtalamaHesaplaAppState createState() => _OrtalamaHesaplaAppState();
}

class _OrtalamaHesaplaAppState extends State<OrtalamaHesaplaApp> {
 var formKey=GlobalKey<FormState>();
 double? secilenHarfDeger=4;
 double? secilenKrediDeger=1;
 String? girilenDersAdi="";

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: Text(Sabitler.baslikText,style: Sabitler.appbarBaslikRenk,)),
        ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
            child: _buildForm(),
          ),

            Expanded(
                flex: 2,
            child: OrtalamaGoster(dersSayisi: DataHelper.tumEklenenDersler.length, ortalama: DataHelper.ortalamaHesapla()),
          )
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/nebula.jpg"),fit: BoxFit.cover)),
              child: DersListesi(
                onDismiss: (index){
                  setState(() {
                    DataHelper.tumEklenenDersler.removeAt(index);
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

 Widget _buildForm() {
    return Form(
    key: formKey,
    child: Column(
      children: [
        Padding(padding: EdgeInsets.only(left: 4),child:_buildTextFormField(),),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 1),child: _buildHarfler(),),
            Padding(padding: EdgeInsets.symmetric(horizontal: 1),child: _buildKrediler(),),
            
            Expanded(child:
             IconButton(
               splashRadius: 12 ,
               onPressed: _dersEkleVeOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp,))),
          ],
      ),
      SizedBox(height: 5,),
      ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger){
        girilenDersAdi=deger;
      },
      validator: (s){
        if (s!.length<=0){
          return "ders adını giriniz";
        }else
        return null;
      },
      decoration: InputDecoration(
        hintText: "Ders adı giriniz",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
        ),
        filled: true,
        fillColor: Colors.grey[400],
      ),
    );
  }

  _buildHarfler() {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade300.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<double>(
        value:secilenHarfDeger,
        onChanged: (deger){
          setState(() {
            secilenHarfDeger=deger;
          });
        },
        items: DataHelper.tumDerslerinHarfleri(),
        underline: Container(),
          
        ),
      ),
    );
  }

  _buildKrediler() {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade300.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<double>(
        value:secilenKrediDeger,
        onChanged: (deger){
          setState(() {
            secilenKrediDeger=deger;
          });
        },
        items: DataHelper.tumDerslerinKredileri(),
        underline: Container(),
          
        ),
      ),
    );
  }

 void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers=Ders(ad:girilenDersAdi!, harfDegeri: secilenHarfDeger!, krediDegeri: secilenKrediDeger!);
    DataHelper.DersEkle(eklenecekDers);
    setState(() {
      
    });
    }
  }
}