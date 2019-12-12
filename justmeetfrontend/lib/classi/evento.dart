 //import 'dart:convert';

class Evento {
      final String id;
      final String titolo;
      final String desc;
    
      Evento(this.id, this.titolo, this.desc);

      Evento.fromJson(Map<String, dynamic> json)
      : id = json['id'],
      titolo = json['titolo'],
      desc = json['desc'];

    
}