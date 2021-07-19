import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uc_bloc_kullanimi/sayacCubit.dart';

class IkinciSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        
        title: Text("Bloc Kullanımı"),
      ),

      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SayacCubit,int>
            (
              builder: (context,sayacDegeri){
                return Text("$sayacDegeri",style: TextStyle(fontSize:36));
            }
              ),
            ElevatedButton(
              onPressed: (){
                context.read<SayacCubit>().sayacArtir();
              }, 
              child: Text("Artır"),
            ),
            ElevatedButton(
              onPressed: (){
                context.read<SayacCubit>().sayaciAzalt(4);
              }, 
              child: Text("Azalt"),
            ),

          ],
          ),
      )
      
    );
  }
}
