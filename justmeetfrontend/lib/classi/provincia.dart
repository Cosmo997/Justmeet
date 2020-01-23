class Provincia {

    String nome;
    String sigla;
    String regione;


    Provincia(this.nome, this.sigla, this.regione);
    Provincia.fromjson(Map<String, dynamic> json)
    :
      nome = json['nome'],
      sigla = json['sigla'],
      regione = json['regione'];
    
    }