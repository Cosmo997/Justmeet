class Comune {
  String nome;
  String provincia;
  Comune(this.nome, this.provincia);
  Comune.fromjson(Map<String, dynamic> json)
  :
    this.nome = json['nome'],
    this.provincia = json['provincia'];
}