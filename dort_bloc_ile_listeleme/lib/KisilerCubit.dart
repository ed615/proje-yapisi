import 'package:dort_bloc_ile_listeleme/KisilerDaoRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'KisilerDurum.dart';

class KisilerCubit extends Cubit<KisilerDurum>{
   KisilerRepository kisilerRepository;
   //epodan alinan nesne ilk durum olarak belirlendi.
   KisilerCubit(this.kisilerRepository):super(KisilerBaslangicSinifi());

   Future<void> kisileriAlveTetikle() async{
     try{
       emit(KisilerYukleniyor());

       var kisiListeCevap = await kisilerRepository.kisileriGetir(); 
       emit(KisilerYuklendi(kisiListeCevap));
     }catch(e){
       emit(KisilerHata("Kişiler görüntülenemedi"));
     }
   }

    Future<void> kisiSilveTetikle(int kisi_id) async{
     try{
       emit(KisilerYukleniyor());

       await kisilerRepository.kisiSil(kisi_id);

       var kisiListeCevap = await kisilerRepository.kisileriGetir(); 
       emit(KisilerYuklendi(kisiListeCevap));
     }catch(e){
       emit(KisilerHata("Kişiler görüntülenemedi"));
     }
   }

  Future<void> kisiKaydetveTetikle(String kisi_ad, String kisi_tel) async{
     try{
       emit(KisilerYukleniyor());

       await kisilerRepository.kayit(kisi_ad,kisi_tel);

       var kisiListeCevap = await kisilerRepository.kisileriGetir(); 
       emit(KisilerYuklendi(kisiListeCevap));
     }catch(e){
       emit(KisilerHata("Kişiler görüntülenemedi"));
     }
   }

   Future<void> kisiGuncelleveTetikle(int kisi_id, String kisi_ad, String kisi_tel) async{
     try{
       emit(KisilerYukleniyor());

       await kisilerRepository.guncelle(kisi_id, kisi_ad,kisi_tel);

       var kisiListeCevap = await kisilerRepository.kisileriGetir(); 
       emit(KisilerYuklendi(kisiListeCevap));
     }catch(e){
       emit(KisilerHata("Kişiler görüntülenemedi"));
     }
   }
  

  }
   
