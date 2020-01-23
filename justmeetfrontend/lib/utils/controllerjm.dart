import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:justmeet/classi/comune.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/classi/provincia.dart';
import 'package:justmeet/classi/regione.dart';
import 'package:justmeet/classi/topic.dart';



/// Responsabilità: Comunicare con il BackEnd.

class ControllerJM 
{
    static String urlBase = "https://springboot-restapi.herokuapp.com";

  static Future<bool> makePostRequest(Evento event) async {
     Map<String, String> headers = {"Content-type": "application/json"};
     print(json.encode(event.toMap()));
     http.Response response = await http.post(urlBase +"/evento", headers: headers, body: json.encode(event.toMap()));
     if(response.statusCode == 200)
     return true;
     else return false;
     }

  static Future<List<Evento>> loadEvents()  async {
    http.Response response = await http.get(urlBase + "/eventi", headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Evento> eventi = collection.map((json) => Evento.fromjson(json)).toList();
    return eventi;
  }

  static Future<List<Regione>> loadRegioni() async {
    http.Response response = await http.get(urlBase + "/regioni", headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Regione> regioni = collection.map((json) => Regione.fromjson(json)).toList();
    return regioni;

  }

  static Future<List<Provincia>> loadProvinciaByRegione(String reg) async {
    http.Response response = await http.get(urlBase+"/provincia/regione/" + reg, headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Provincia> pr = collection.map((json) => Provincia.fromjson(json)).toList();
    return pr;
  }

  static Future<List<Comune>> loadComuneBySiglaProvincia(String siglaprovincia) async {
    http.Response response = await http.get(urlBase+ "/comune/provincia/" + siglaprovincia, headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Comune> pr = collection.map((json) => Comune.fromjson(json)).toList();
    return pr;
  }

  static Future<List<Topic>> loadTopics() async {
    http.Response response = await http.get(urlBase + "/topics", headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Topic> topic = collection.map((json) => Topic.fromjson(json)).toList();
    return topic;
  }
// TODO Url mancante
//   static Future<List<Evento>> loadPreferitiByUtente(String idUtente) async {
//     http.Response response = await http.get(urlTopics, headers: {"Accept" : "application/json"});
//     List collection = json.decode(response.body);
//     List<Evento> preferiti = collection.map((json) => Evento.fromjson(json)).toList();
//     return preferiti;
//   }
}