import 'package:http/http.dart' as http;
import 'dart:convert';

import 'classi/evento.dart';


class ControllerJM 
{
  static String urlSpring = "https://springboot-restapi.herokuapp.com/eventi";

  static sendEvent(Evento eventissimo)
  {
    http.post(urlSpring, body: json.encode(eventissimo));
  }


}