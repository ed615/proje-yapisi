import 'package:dort_bloc_ile_listeleme/KisilerCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Kisiler.dart';

class KisiGuncelle extends StatefulWidget {
  Kisiler kisi;
  KisiGuncelle({required this.kisi});

  @override
  _KisiGuncelleState createState() => _KisiGuncelleState();
}

class _KisiGuncelleState extends State<KisiGuncelle> {
  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfKisiAd.text = kisi.kisi_ad;
    tfKisiTel.text = kisi.kisi_tel;
  }

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
         BlocProvider.of<KisilerCubit>(context).kisiGuncelleveTetikle(int.parse(widget.kisi.kisi_id),tfKisiAd.text,tfKisiTel.text);
        } ,
        tooltip: "Güncelle",
        label: Text("Güncelle"),
        icon: Icon(Icons.update),
        )

    
    );
  }
}