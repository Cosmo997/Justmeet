
class User
{
  String id;
  String nome;
  String cognome;
  String username;
  String email;
  String psw;
  bool isLogged;
  List<String> preferiti;

  User(this.id, this.nome,this.cognome,this.username, this.email, this.psw, this.isLogged, this.preferiti);
  
  User.fromJson(Map<String, dynamic> json)
    :
    id = json['id'], 
    nome = json['nome'],
    cognome = json['cognome'],
    username = json['username'],
    email = json['email'],
    psw = json['psw'],
    isLogged = json['isLogged'];
  
}