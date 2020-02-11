class Comune {
  String nome;
  String siglaProvincia;
  Comune(this.nome, this.siglaProvincia);
  Comune.fromjson(Map<String, dynamic> json)
  :
    this.nome = json['nome'],
    this.siglaProvincia = json['siglaProvincia'];
}