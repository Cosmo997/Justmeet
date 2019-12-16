 //import 'dart:convert';

class Evento {
      final String id;
      final String titolo;
      final String desc;
      final int partecipanti; 
      final Topic topic;    
      final Luogo luogo;
    
    Evento();

  Map toMap() 
{
    var map = new Map<String, dynamic>();
    map["id"] = this.id;
    map["titolo"] = this.nome;
    map["desc"] = this.desc;
    map["maxP"] = this.maxPartecipanti;
    return map;
  }
Evento fromJson(Map<String, dynamic> json)
        {
          id = json['id'],
          titolo = json['titolo'],
          desc = json['desc'],
          partecipanti = json['partecipanti'],
          topic = Topic.fromJson(json['topic']),
          luogo = Luogo.fromJson(json['luogo']);
        }
  
	String getId() {
		return this.id;
	}

	void setId(String id) {
		this.id = id;
	}

	String getNome() {
		return this.nome;
	}

	void setNome(String titolo) {
		this.nome = titolo;
	}

	String getDesc() {
		return this.desc;
	}

	void setDesc(String desc) {
		this.desc = desc;
	}

	int getMaxPartecipanti() {
		return this.maxPartecipanti;
	}

	void setMaxPartecipanti(int maxPartecipanti) {
		this.maxPartecipanti = maxPartecipanti;
	}

}

      