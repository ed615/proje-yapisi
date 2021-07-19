import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uc_bloc_kullanimi/ikinciSayfa.dart';
import 'package:uc_bloc_kullanimi/sayacCubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>SayacCubit())
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


class Anasayfa extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        
        
        title: Text("Bloc Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<SayacCubit,int>
            (
              builder: (context,sayacDegeri){
                return Text("$sayacDegeri",style: TextStyle(fontSize:36));
            }
            ),
            ElevatedButton(
              child:Text("Geçiş Yap"),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>IkinciSayfa()));
              }
            ),
          ],
        ),
      ), 
    );
  }
}
