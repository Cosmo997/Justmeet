import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:justmeet/classi/comune.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/classi/provincia.dart';
import 'package:justmeet/classi/regione.dart';
import 'package:justmeet/classi/topic.dart';
import 'package:justmeet/classi/user.dart';



/// Responsabilità: "Comunicare con il BackEnd.""

class ControllerJM 
{
    static String urlBase = "https://springboot-restapi.herokuapp.com";

  static Future<bool> makePostRequest(Evento event) async {
     Map<String, String> headers = {"Content-type": "application/json"};
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

   static Future<List<Evento>> loadPreferitiByUtente(Future<String> idUtente) async {
     String id = await idUtente;
     http.Response response = await http.get(urlBase + "/user/prefeiti/" +id , headers: {"Accept" : "application/json"});
     List<Evento> preferiti = [];
     List<String> idEventiPreferiti = (jsonDecode(response.body) as List<dynamic>).cast<String>();
     for (int i = 0; i < idEventiPreferiti.length; i++) {
       http.Response response = await http.get(urlBase + "/evento/id/" +idEventiPreferiti[i], headers: {"Accept" : "application/json"});
       Evento e = Evento.fromjson(jsonDecode(response.body));
       preferiti.add(e);
     }
     return preferiti;
   }

   static Future<List<Evento>> loadEventiByIdCreatore(Future<String> idUtente) async {

     String id = await idUtente;
     http.Response response = await http.get(urlBase + "/eventi/idcreatore/" +id , headers: {"Accept" : "application/json"});
     List collection = json.decode(response.body);
     List<Evento> myEvent = collection.map((json) => Evento.fromjson(json)).toList();
     return myEvent;
   }

  static Future<bool> postUser(User newuser) async {
    print(json.encode(newuser.toMap()));
    http.Response response = await http.post(urlBase + "/user", headers: {"Accept" : "application/json"}, body: json.encode(newuser.toMap()));
    if(response.statusCode == 200) return true;
    else return false;

  }

  static Future<User> getUserById(Future<String> idUtente) async {
    String id = await idUtente;
    http.Response response = await http.get(urlBase + "/user/id/" +id,  headers: {"Accept" : "application/json"});
    User user = User.fromJson(jsonDecode(response.body));
    return user;
  }

  static void addPreferito(Future<String> idUser, String idEvento) async {
    String id = await idUser;
    await http.put(urlBase + "/user/addpreferiti?idUser="+id+"&idEvento="+idEvento);
  }

  static void deletePreferito(Future<String> idUser, String idEvento) async {
    String id = await idUser;
    await http.put(urlBase + "/user/deletepreferiti?idUser="+id+"&idEvento="+idEvento);
  }

   static void addIscrizione(String idEvento, String idUser) async {
    await http.put(urlBase + "/evento/iscrizione/update?idEvento="+idEvento+"&idUser="+idUser);
  }

    static void deleteIscrizione(String idEvento, String idUser) async {
    await http.put(urlBase + "/evento/iscrizione/delete?idEvento="+idEvento+"&idUser="+idUser);
  }

  static Future<String> getNomeByIdUser(String idUser) async{
    http.Response response = await http.get(urlBase + "/user/id/" +idUser,  headers: {"Accept" : "application/json"});
    User user = User.fromJson(jsonDecode(response.body));
    return user.nome;
  }

  static Future<List<Evento>> search(String titolo, String topic, String comune) async {
    http.Response response = await http.get(urlBase + "eventi/search?titolo=" + titolo +"&idTopic=" + topic +"&idComune=" + comune,  headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Evento> myEvent = collection.map((json) => Evento.fromjson(json)).toList();
    return myEvent;
  }

  static Future<List<Comune>> loadComuni() async {
    http.Response response = await http.get(urlBase+ "/comune", headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Comune> pr = collection.map((json) => Comune.fromjson(json)).toList();
    return pr;
  }
}