import 'dart:convert';

import 'package:justmeet/utils/controllerjm.dart';
import 'package:http/http.dart' as http;
import 'package:justmeet/model/comune.dart';
import 'package:justmeet/model/provincia.dart';
import 'package:justmeet/model/regione.dart';

class LuogoController extends ControllerJM {

  LuogoController();

  Future<List<Regione>> loadRegioni() async {
    http.Response response = await http.get(getUrlBase() + "/regioni", headers: getHeaders());
    List collection = json.decode(response.body);
    List<Regione> regioni = collection.map((json) => Regione.fromjson(json)).toList();
    return regioni;
  }

  Future<List<Provincia>> loadProvinciaByRegione(String reg) async {
      http.Response response = await http.get(getUrlBase()+"/provincia/regione/" + reg, headers: getHeaders());
      List collection = json.decode(response.body);
      List<Provincia> pr = collection.map((json) => Provincia.fromjson(json)).toList();
      return pr;
    }

  Future<List<Comune>> loadComuneBySiglaProvincia(String siglaprovincia) async {
      http.Response response = await http.get(getUrlBase()+ "/comune/provincia/" + siglaprovincia, headers: getHeaders());
      List collection = json.decode(response.body);
      List<Comune> pr = collection.map((json) => Comune.fromjson(json)).toList();
      return pr;
    }

  Future<List<Comune>> loadComuni() async {
    http.Response response = await http.get(getUrlBase()+ "/comune", headers: getHeaders());
    List collection = json.decode(response.body);
    List<Comune> pr = collection.map((json) => Comune.fromjson(json)).toList();
    return pr;
    }

}