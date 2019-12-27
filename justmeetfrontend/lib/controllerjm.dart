import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:justmeet/classi/evento.dart';

/// Responsabilità: Comunicare con il BackEnd.

class ControllerJM 
{
  static String urlEventi = "https://springboot-restapi.herokuapp.com/eventi";
  static String urlLuoghi = "https://springboot-restapi.herokuapp.com/luoghi";

  static Future<bool> makePostRequest(Evento event) async 
      {
                    Map<String, String> headers = {"Content-type": "application/json"};
                    print(json.encode(event.toMap()));
                    http.Response response = await http.post(urlEventi, headers: headers, body: json.encode(event.toMap()));
                    if(response.statusCode == 200)
                    return true;
                    else return false;
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