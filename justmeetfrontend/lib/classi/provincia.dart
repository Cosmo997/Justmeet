class Provincia {

    String nome;
    String sigla;
    String nomeRegione;

    Provincia(this.nome, this.sigla, this.nomeRegione);
    Provincia.fromjson(Map<String, dynamic> json)
    :
      nome = json['nome'],
      sigla = json['sigla'],
      nomeRegione = json['nomeRegione'];
    
    }