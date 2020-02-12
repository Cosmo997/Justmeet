import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:justmeet/model/evento.dart';
import 'package:justmeet/utils/controllerjm.dart';

class EventoController extends ControllerJM{
  
  EventoController();

  Future<bool> postEvent(Evento event) async {
     http.Response response = await http.post( getUrlBase() +"/evento", headers: {"Content-type": "application/json"}, body: json.encode(event.toMap()));
     if(response.statusCode == 200)
     return true;
     else return false;
     }

 Future<List<Evento>> loadPreferitiByUtente(Future<String> idUtente) async {
     String id = await idUtente;
     http.Response response = await http.get(getUrlBase() + "/user/prefeiti/" +id , headers: getHeaders());
     List<Evento> preferiti = [];
     List<String> idEventiPreferiti = (jsonDecode(response.body) as List<dynamic>).cast<String>();
     for (int i = 0; i < idEventiPreferiti.length; i++) {
       http.Response response = await http.get(getUrlBase() + "/evento/id/" +idEventiPreferiti[i], headers: getHeaders());
       Evento e = Evento.fromjson(jsonDecode(response.body));
       preferiti.add(e);
     }
     return preferiti;
   }

  Future<List<Evento>> loadEventiByIdCreatore(Future<String> idUtente) async {

     String id = await idUtente;
     http.Response response = await http.get(getUrlBase() + "/eventi/idcreatore/" +id , headers: getHeaders());
     List collection = json.decode(response.body);
     List<Evento> myEvent = collection.map((json) => Evento.fromjson(json)).toList();
     return myEvent;
   }

  void addIscrizione(String idEvento, String idUser) async {
    await http.put(getUrlBase() + "/evento/iscrizione/update?idEvento="+idEvento+"&idUser="+idUser);
  }
  void deleteIscrizione(String idEvento, String idUser) async {
    await http.put(getUrlBase() + "/evento/iscrizione/delete?idEvento="+idEvento+"&idUser="+idUser);
  }

  void approvaEvento(String idEvento) async {
    await http.put(getUrlBase() + "/evento/approva?idEvento="+idEvento);
  }

  void rifiutaEvento(String idEvento) async {
    await http.delete(getUrlBase() + "/evento/"+idEvento);
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
  Future<List<Evento>> loadEventsToBeApproved()  async {
    http.Response response = await http.get(getUrlBase() + "/eventi/isapproved/false", headers: getHeaders());
    List collection = json.decode(response.body);
    List<Evento> eventi = collection.map((json) => Evento.fromjson(json)).toList();
    return eventi;
  }

  Future<List<Evento>> loadEventsApproved()  async {
    http.Response response = await http.get(getUrlBase() + "/eventi/isapproved/true", headers: getHeaders());
    List collection = json.decode(response.body);
    List<Evento> eventi = collection.map((json) => Evento.fromjson(json)).toList();
    return eventi;
  }
}