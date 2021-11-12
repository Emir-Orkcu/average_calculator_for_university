import 'package:average_calculator/constants/app_constants.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:average_calculator/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi ({required this.onDismiss, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <Ders>tumDersler=DataHelper.tumEklenenDersler;
    return tumDersler.length>0 ? ListView.builder(
      itemCount: tumDersler.length,
      itemBuilder: (context,index){
        return Dismissible(
          direction: DismissDirection.startToEnd,
          key: UniqueKey(),
          onDismissed: (a){
            onDismiss(index);
          }, 
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: ListTile(
                title: Text(tumDersler[index].ad,),
                leading: CircleAvatar(
                  backgroundColor:Sabitler.anaRenk,
                  child: Text((tumDersler[index].harfDegeri*tumDersler[index].krediDegeri).toStringAsFixed(0),),
             ),
             subtitle: Text("${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}"),
              )),
          ),
        );
      }) : Container(
        child: Center(
          child: 
          Text("Ders Ekleyin",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            ),)),);
      
    
  }
}