import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iki_mobx_kullanimi/ikinciSayfa.dart';
import 'package:iki_mobx_kullanimi/sayacModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Anasayfa(),
    );
  }
}


class Anasayfa extends StatelessWidget {
  var sayacModelNesne = SayacModel();

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: Text("mobx Sayaç Uygulaması"),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>IkinciSayfa()));
              },
              child: Text("Geçiş Yap"),
              )
          ],
        ),
      ),
    );
  }
}
