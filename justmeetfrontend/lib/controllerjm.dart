import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:justmeet/classi/comune.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/classi/provincia.dart';
import 'package:justmeet/classi/topic.dart';

import 'classi/regione.dart';

/// Responsabilità: Comunicare con il BackEnd.

class ControllerJM 
{
  static final String urlEventi = "https://springboot-restapi.herokuapp.com/eventi";
  static final String urlLuoghi = "https://springboot-restapi.herokuapp.com/luoghi";
  static final String urlRegioni = "https://springboot-restapi.herokuapp.com/regioni";
  static final String urlProvincia = "https://springboot-restapi.herokuapp.com/regioni/province/";
  static final String urlComune = "https://springboot-restapi.herokuapp.com/regioni/provincia/comuni/";
  static final String urlTopics = "https://springboot-restapi.herokuapp.com/topics";
  static final String urlPreferiti = "https://springboot-restapi.herokuapp.com/";

  static Future<bool> makePostRequest(Evento event) async {
     Map<String, String> headers = {"Content-type": "application/json"};
     print(json.encode(event.toMap()));
     http.Response response = await http.post(urlEventi, headers: headers, body: json.encode(event.toMap()));
     if(response.statusCode == 200)
     return true;
     else return false;
     }

  static Future<List<Evento>> loadEvent()  async {
    http.Response response = await http.get(Uri.encodeFull(urlEventi), headers: {"Accept" : "application/json"});
    print("Risposta ricevuta");
    print("Body: " +response.body);
    List collection = json.decode(response.body);
    List<Evento> eventi = collection.map((json) => Evento.fromjson(json)).toList();
    return eventi;
  }

  static Future<List<Regione>> loadRegioni() async {
    http.Response response = await http.get(Uri.encodeFull(urlRegioni), headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Regione> regioni = collection.map((json) => Regione.fromjson(json)).toList();
    return regioni;

  }

  static Future<List<Provincia>> loadProvinciaByRegione(String reg) async {
    http.Response response = await http.get(Uri.encodeFull(urlProvincia + reg), headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Provincia> pr = collection.map((json) => Provincia.fromjson(json)).toList();
    return pr;
  }

  static Future<List<Comune>> loadComuneByProvincia(String pro) async {
    http.Response response = await http.get(Uri.encodeFull(urlComune + pro), headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Comune> pr = collection.map((json) => Comune.fromjson(json)).toList();
    return pr;
  }

  static Future<List<Topic>> loadTopics() async {
    http.Response response = await http.get(Uri.encodeFull(urlTopics), headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Topic> topic = collection.map((json) => Topic.fromjson(json)).toList();
    return topic;
  }
//TODO Url mancante
  static Future<List<Evento>> loadPreferitiByUtente(String idUtente) async {
    http.Response response = await http.get(Uri.encodeFull(urlTopics), headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Evento> preferiti = collection.map((json) => Evento.fromjson(json)).toList();
    return preferiti;
  }
}