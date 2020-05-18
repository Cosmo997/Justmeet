import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:justmeet/model/evento.dart';
import 'package:justmeet/model/user.dart';
import 'package:justmeet/utils/controllerAPI/user_token_controller.dart';
import 'package:justmeet/utils/controllerjm.dart';

class EventoTokenController extends ControllerJM{
  
  EventoTokenController();

  static String token;
  static String id;

  Future<bool> postEvent(Evento evento, Future<String> tokenUser) async {
    token =  await tokenUser;
    print("Token: " +token);
    http.Response response = await http.post(getUrlBase() +"/eventowithtoken",
    headers: {"Content-type": "application/json", "token" : token},
    body: json.encode(evento.toMap()));
    print("Status: " +response.statusCode.toString());
    if(response.statusCode == 200)
    return true;
    else 
    return false;
  }

  Future<List<Evento>> loadEventiByIdCreatore(Future<String> idUtente, Future<String> tokenUser) async {
    token = await tokenUser;
    id = await idUtente;
    http.Response response = await http.get(getUrlBase() + "/eventi/myevent?idCreatore=" +id ,
    headers: {"Content-type" : "application/json", "token" : token});
    List collection = json.decode(response.body);
    List<Evento> myEvent = collection.map((json) => Evento.fromjson(json)).toList();
    return myEvent;
  }

  Future<List<Evento>> loadEventsToBeApproved(Future<String> tokenUser)  async {
    token = await tokenUser;
    http.Response response = await http.get(getUrlBase() + "/eventi/isnotapproved",
    headers: {"Content-type" : "application/json", "token" : token});
    List collection = json.decode(response.body);
    List<Evento> eventi = collection.map((json) => Evento.fromjson(json)).toList();
    return eventi;
  }

  Future<List<Evento>> loadEventsApproved()  async {
    http.Response response = await http.get(getUrlBase() + "/eventi/isapproved", headers: getHeaders());
    List collection = json.decode(response.body);
    List<Evento> eventi = collection.map((json) => Evento.fromjson(json)).toList();
    return eventi;
  }

  Future<List<Evento>> loadEventiWhereUserIsSub(Future<String> idUtente, Future<String> tokenUser) async {
    token = await tokenUser;
    id = await idUtente;
    http.Response response = await http.get(getUrlBase() + "/eventi/mysub?idUser="+id,
    headers: {"Content-type" : "application/json", "token" : token});
    List collection = json.decode(response.body);
    List<Evento> myEvent = collection.map((json) => Evento.fromjson(json)).toList();
    return myEvent;
  }

  Future<List<Evento>> loadPreferitiByUtente(Future<String> idUtente, Future<String> token) async {
    UserTokenController userTokenController = new UserTokenController();
    User app = await userTokenController.getUserByIdWithToken(idUtente, token);
    List<Evento> preferiti = [];
    List<String> idEventiPreferiti = app.getPreferiti();
    for (int i = 0; i < idEventiPreferiti.length; i++) {
       http.Response response = await http.get(getUrlBase() + "/evento/id/" +idEventiPreferiti[i], headers: getHeaders());
       if(response.body != null)
       {
       Evento e = Evento.fromjson(jsonDecode(response.body));
       if(e != null)
       preferiti.add(e);
       }
     }
     return preferiti;
   }

  Future<List<Evento>> search(String titolo, String topic, String comune) async {
    if(titolo == null)
    titolo = "null";
    if(topic == null)
    topic = "null";
    if(comune == null)
    comune = "null";
    http.Response response = await http.get(getUrlBase() + "/eventi/search/?titolo=" + titolo +"&idTopic=" + topic +"&idComune=" + comune,  headers: getHeaders());
    List collection = json.decode(response.body);
    List<Evento> myEvent = collection.map((json) => Evento.fromjson(json)).toList();
    return myEvent;
  }
  
  void addIscrizione(String idEvento, String idUser, Future<String> tokenUser) async {
    token = await tokenUser;
    await http.put(getUrlBase() + "/evento/iscrizione/add?idEvento="+idEvento+"&idUser="+idUser,
    headers: {"Accept" : "application/json", "token" : token});
  }
  void deleteIscrizione(String idEvento, String idUser, Future<String> tokenUser) async {
    token = await tokenUser;
    await http.put(getUrlBase() + "/evento/iscrizione/remove?idEvento="+idEvento+"&idUser="+idUser,
    headers: {"Accept" : "application/json", "token" : token});
  }

  void approvaEvento(String idEvento, Future<String> tokenUser) async {
    token = await tokenUser;
    await http.put(getUrlBase() + "/evento/approvabymod?idEvento="+idEvento,
    headers: {"Accept" : "application/json", "token" : token});
  }

  void rifiutaEvento(String idEvento, Future<String> tokeUser) async {
    token = await tokeUser;
    await http.delete(getUrlBase() + "/evento?idEvento="+idEvento,
    headers: {"Content-type" : "application/json", "token" : token});
  }

}