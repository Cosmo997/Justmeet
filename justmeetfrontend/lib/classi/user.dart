
class User
{
  String _id;
  String nome;
  String cognome;
  String email;
  String password;
  bool isMod;
  List<String> preferiti;


  User(this.nome,this.cognome, this.email, this.password);
  
  User.fromJson(Map<String, dynamic> json)
    :
    _id = json['_id'], 
    nome = json['nome'],
    cognome = json['cognome'],
    email = json['email'],
    password = json['password'];
  
  Map<String, dynamic> toMap() 
  {
    var map = new Map<String, dynamic>();
    map["_id"] = this._id;
    map["nome"] = this.nome;
    map["cognome"] = this.cognome;
    map["email"] = this.email;
    map["password"] = this.password;
    map["isMod"] = this.isMod; 
    return map;
  }
}