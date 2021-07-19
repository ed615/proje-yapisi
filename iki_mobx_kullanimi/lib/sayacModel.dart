import 'package:mobx/mobx.dart';

part 'sayacModel.g.dart';

class SayacModel = SayacModelBase with _$SayacModel;

abstract class SayacModelBase with Store{

@observable
int sayac=0;

@action
void sayacArtir(){
  sayac++;
}

@action
void sayacAzalt(int miktar){
  sayac = sayac - miktar;
}

}