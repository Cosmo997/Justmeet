
class Evento {
  
      String id;
      String titolo;
      String desc;
      int partecipanti; 
      String idTopic;    
      String nomeComune;
      String idCreatore;
      DateTime inizioEvento;
      DateTime fineEvento;
      bool isApproved;

    Evento(this.id, this.titolo, this.desc, this.partecipanti, this.idTopic, this.nomeComune, this.idCreatore,this.inizioEvento, this.fineEvento, this.isApproved);

  Map toMap() 
  {
    var map = new Map<String, dynamic>();
    map["id"] = this.id;
    map["titolo"] = this.titolo;
    map["desc"] = this.desc;
    map["partecipanti"] = this.partecipanti;
    map["topic"] = this.idTopic;
    map["idComune"] = this.nomeComune;
    map["idCreatore"] = this.idCreatore;
    map["inizioEvento"] = this.inizioEvento.toIso8601String();
    map["fineEvento"] = this.fineEvento.toIso8601String();
    map["isApproved"] = this.isApproved;
    return map;
  }

Evento.fromJson(Map<String, dynamic> json)
        :
          id = json['id'],
          titolo = json['titolo'],
          desc = json['desc'],
          partecipanti = json['partecipanti'],
          idTopic = json['idTopic'],
          nomeComune = json['nomeComune'],
          idCreatore = json['user'],
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

      