
class User
{
  String nome;
  String cognome;
  String username;

  User(this.nome,this.cognome,this.username);
  
  User.fromJson(Map<String, dynamic> json)
    : username = json['username'],
    nome = json['nome'],
    cognome = json['cognome'];
  
}