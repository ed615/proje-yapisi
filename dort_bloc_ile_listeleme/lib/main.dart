import 'package:dort_bloc_ile_listeleme/KisiEkle.dart';
import 'package:dort_bloc_ile_listeleme/KisiGuncelle.dart';
import 'package:dort_bloc_ile_listeleme/KisilerCubit.dart';
import 'package:dort_bloc_ile_listeleme/KisilerDurum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'KisilerDaoRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=>KisilerCubit(KisilerDaoRepository()),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
    
          primarySwatch: Colors.blue,
        ),
        home: Anasayfa(),
      ),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState(){
    super.initState();
    context.read<KisilerCubit>().kisileriAlveTetikle();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Cubit İle Listeleme (Http)"),
      ),
      //dinleme islemi
      body: BlocBuilder<KisilerCubit,KisilerDurum>(
        builder:(context,kisilerDurum){
          if(kisilerDurum is KisilerYuklendi){
            var kisiListesi = kisilerDurum.kisiListesi;//yuklendiyse listeyi dondur
            return ListView.builder(
              itemCount: kisiListesi.length,
              itemBuilder: (context,indeks){
                var kisi = kisiListesi[indeks];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>KisiGuncelle(kisi: kisi)));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                            IconButton(
                              icon: Icon(Icons.delete,color:Colors.black45),
                              onPressed: (){
                                context.read<KisilerCubit>().kisiSilveTetikle(int.parse(kisi.kisi_id));
                              }
                            )
                          ],
                          ),
                      )
                      ),
                  ),
                );
              },
            );
          }else
          return Center();
        } ,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>KisiEkle()));
        } ,
        tooltip: "Kişi ekle",
        child: Icon(Icons.add),
        )

    
    );
  }
}
