import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dort_bloc_ile_listeleme/Kisiler.dart';

import 'KisilerCevap.dart';

abstract class KisilerRepository{
  Future<List<Kisiler>> kisileriGetir();
  Future<void> kisiSil(int kisi_id);
  Future<void> kayit(String kisi_adi, String kisi_tel);
  Future<void> guncelle(int kisi_id, String kisi_adi, String kisi_tel);
}

class KisilerDaoRepository implements KisilerRepository{

  List<Kisiler> parseKisilerCevap(String cevap){
    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  @override
  Future<List<Kisiler>> kisileriGetir() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);

  }

  @override
  Future<void> kisiSil(int kisi_id) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php");
    var veri = {"kisi_id":kisi_id.toString()};
    var cevap = await http.post(url, body:veri);
    print("silme cevap: ${cevap.body}");

  }

  @override
  Future<void> kayit(String kisi_ad,String kisi_tel) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php");
    var veri = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await http.post(url, body:veri);
    print("kayit cevap: ${cevap.body}");

  }

  @override
  Future<void> guncelle(int kisi_id,String kisi_ad,String kisi_tel) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/update_kisiler.php");
    var veri = {"kisi_id": kisi_id.toString(),"kisi_ad":kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await http.post(url, body:veri);
    print("Güncelleme cevap: ${cevap.body}");

  }
}