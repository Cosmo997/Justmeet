 //import 'dart:convert';

import 'luogo.dart';
import 'topic.dart';

class Evento {
  
      String id;
      String titolo;
      String desc;
      int partecipanti; 
      Topic topic;    
      Luogo idComune;
      String idCreatore;
      DateTime inizioEvento;
      DateTime fineEvento;


    Evento(this.id, this.titolo, this.desc, this.partecipanti, this.topic, this.idComune, this.idCreatore,this.inizioEvento, this.fineEvento);

  Map toMap() 
  {
    var map = new Map<String, dynamic>();
    map["id"] = this.id;
    map["titolo"] = this.titolo;
    map["desc"] = this.desc;
    map["partecipanti"] = this.partecipanti;
    map["topic"] = this.topic.id;
    map["idComune"] = this.idComune;
    map["idCreatore"] = this.idCreatore;
    map["inizioEvento"] = inizioEvento.toIso8601String();
    map["fineEvento"] = fineEvento.toIso8601String();
    return map;
  }

Evento.fromJson(Map<String, dynamic> json)
        :
          id = json['id'],
          titolo = json['titolo'],
          desc = json['desc'],
          partecipanti = json['partecipanti'],
          topic = Topic.fromJson2(json['topic']),
          idComune = Luogo.fromJson(json['luogo']),
          idCreatore = json['user'];
          
  
	String getId() {
		return this.id;
	}

	void setId(String id) {
		this.id = id;
	}

	String getNome() {
		return this.titolo;
	}

	void setNome(String titolo) {
		this.titolo = titolo;
	}

	String getDesc() {
		return this.desc;
	}

	void setDesc(String desc) {
		this.desc = desc;
	}

	int getMaxPartecipanti() {
		return this.partecipanti;
	}

	void setMaxPartecipanti(int maxPartecipanti) {
		this.partecipanti = maxPartecipanti;
	}

}

      