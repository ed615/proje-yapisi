import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iki_mobx_kullanimi/sayacModel.dart';

class IkinciSayfa extends StatelessWidget {

  var sayacModelNesne = SayacModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayaç Sayfası"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_){
                return Text("${sayacModelNesne.sayac}",style:TextStyle(fontSize: 30));
              }
              ),
            
            ElevatedButton(
              onPressed:(){
                sayacModelNesne.sayacArtir();
              },
              child: Text("Artır"),
              ),
              ElevatedButton(
              onPressed:(){
                sayacModelNesne.sayacAzalt(3);
              },
              child: Text("Azalt"),
              )
          ],
        ),
      ),
    );
  }
}