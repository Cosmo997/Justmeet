class Regione {
  
  String nome;
Regione(this.nome);
Regione.fromjson(Map<String, dynamic> json)
:
nome = json['nome'];
}