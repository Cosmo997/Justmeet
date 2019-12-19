import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:justmeet/classi/evento.dart';

/// Responsabilità: Comunicare con il BackEnd.

class ControllerJM 
{
  static String urlEventi = "https://springboot-restapi.herokuapp.com/eventi";
  static String urlLuoghi = "https://springboot-restapi.herokuapp.com/luoghi";

  static sendEvent(Evento eventissimo)
  {
     http.post(
       urlEventi,
       body: eventissimo.toMap()
       );
  }

   
  

   Future<List<Evento>> loadEvent()  async {
    http.Response response = await http.get(Uri.encodeFull(urlEventi), headers: {"Accept" : "application/json"});
    print("Risposta ricevuta");
    print("Body: " +response.body);
    List collection = json.decode(response.body);
    List<Evento> eventi = collection.map((json) => Evento.fromJson(json)).toList();
    return eventi;
  }

}