class Evento {
  
      String id;
      String titolo;
      String descrizione;
      int partecipanti; 
      String idTopic;   
      String idCreatore; 
      String idComune;
      bool isApproved;
      DateTime inizioEvento;
      DateTime fineEvento;
      List<String> iscrizioni;
      

      
    Evento(String titolo, String descrizione, int partecipanti, String idTopic, String idCreatore, String idComune, String inizioEvento ,String fineEvento)
    {
      this.titolo = titolo;
      this.descrizione = descrizione;
      this.partecipanti = partecipanti;
      this.idTopic = idTopic;
      this.idCreatore = idCreatore;
      this.idComune = idComune;
      this.inizioEvento = DateTime.parse(inizioEvento);
      this.fineEvento = DateTime.parse(fineEvento);
    }

  Map<String, dynamic> toMap() 
  {
    var map = new Map<String, dynamic>();
    map["titolo"] = this.titolo;
    map["descrizione"] = this.descrizione;
    map["partecipanti"] = this.partecipanti;
    map["idTopic"] = this.idTopic;
    map["idCreatore"] = this.idCreatore;
    map["idComune"] = this.idComune;
    map["inizioEvento"] = this.inizioEvento.toIso8601String();
    map["fineEvento"] = this.fineEvento.toIso8601String();
    return map;
  }


Evento.fromjson(Map<String, dynamic> json)
        :
          id = json['id'],
          titolo = json['titolo'],
          descrizione = json['descrizione'],
          partecipanti = json['partecipanti'],
          idTopic = json['idTopic'],
          idCreatore = json['idCreatore'],
          idComune = json['idComune'],
          isApproved = json['isApproved'],
          inizioEvento = DateTime.parse(json['inizioEvento']),
          fineEvento = DateTime.parse(json['fineEvento']);
          //iscrizioni = 
            
  
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
		return this.descrizione;
	}

	void setDesc(String desc) {
		this.descrizione = desc;
	}

	int getMaxPartecipanti() {
		return this.partecipanti;
	}

	void setMaxPartecipanti(int maxPartecipanti) {
		this.partecipanti = maxPartecipanti;
	}

@override
  String toString() {
    String infoEvento;
    infoEvento = "ID: "+ id +"\n"+
                  "Titolo: "+ titolo + "\n"+
                  "Descrizione: "+ descrizione + "\n"+
                  "Partecipanti: "+ partecipanti.toString() + "\n"+
                  "Topic: "+ idTopic + "\n"+
                  "Comune: "+ idComune + "\n"+
                  "Creatore: "+ idCreatore + "\n"+
                  "Inizio:"+ inizioEvento.toIso8601String() + "\n"+
                  "Fine: "+ fineEvento.toIso8601String() + "\n"+
                  "Approvato: " + isApproved.toString();
    return infoEvento;
  }
}

      