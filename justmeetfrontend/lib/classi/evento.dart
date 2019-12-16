

import 'luogo.dart';
import 'topic.dart';

class Evento {
      final String id;
      final String titolo;
      final String desc;
      final int partecipanti; 
      final Topic topic;    
      final Luogo luogo;
      
      Evento(this.id, this.titolo, this.desc, this.partecipanti, this.topic, this.luogo);

      Evento.fromJson(Map<String, dynamic> json)
        :
          id = json['id'],
          titolo = json['titolo'],
          desc = json['desc'],
          partecipanti = json['partecipanti'],
          topic = Topic.fromJson(json['topic']),
          luogo = Luogo.fromJson(json['luogo']);
      
}