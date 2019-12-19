 //import 'dart:convert';

import 'dart:convert';

class Evento {
  
       String id;
       String titolo;
       String desc;
       int partecipanti; 
       String idTopic;    
       String nomeComune;
       String idCreatore;
       bool isApproved;
    
  Evento(this.id, this.titolo, this.desc, this.partecipanti, this.idTopic, this.idCreatore, this.nomeComune, this.isApproved);

  Map toMap() 
  {
    var map = new Map<String, dynamic>();
    map["id"] = this.id;
    map["titolo"] = this.titolo;
    map["desc"] = this.desc;
    map["partecipanti"] = this.partecipanti;
    map["idTopic"] = this.idTopic;
    map["idCreator"] = this.idCreatore;
    map['idApproved'] = this.isApproved;
    //TODO da finire 
    return map;
  }

Evento.fromJson(Map<String, dynamic> json)
        :
          id = json['id'],
          titolo = json['titolo'],
          desc = json['desc'],
          partecipanti = json['partecipanti'],
          idTopic = json['idTopic'],
          idCreatore = json['idCreator'],
          nomeComune = json['nomeComune'],
          isApproved = json['isApproved'];
    
  
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

      