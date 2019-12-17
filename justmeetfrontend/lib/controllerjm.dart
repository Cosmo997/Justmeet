import 'package:http/http.dart' as http;
import 'package:justmeet/classi/luogo.dart';
import 'classi/evento.dart';

/**
 * Responsabilità: Comunicare con il BackEnd.
 */
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
  static List<Luogo> getLuoghi()
  {
    http.get(urlEventi,
    
    );
  }

}