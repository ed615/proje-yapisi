import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'KisilerCubit.dart';

class KisiEkle extends StatefulWidget {
  @override
  _KisiEkleState createState() => _KisiEkleState();
}

class _KisiEkleState extends State<KisiEkle> {
  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc liste kayıt"),
      ),
      //dinleme islemi
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:50,right:50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            TextField(
              controller: tfKisiAd,
              decoration: InputDecoration(
                hintText: "Kişi adı giriniz"
              )
            ),
            TextField(
              controller: tfKisiTel,
              decoration: InputDecoration(
                hintText: "Kişi telefon giriniz"
              )
            )
          ],),
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){
          BlocProvider.of<KisilerCubit>(context).kisiKaydetveTetikle(tfKisiAd.text, tfKisiTel.text);
        } ,
        tooltip: "Kaydet",
        label: Text("Kaydet"),
        icon: Icon(Icons.save),
        )

    
    );
  }
}