
class User
{
  String _id;
  String nome;
  String cognome;
  String email;
  bool isMod;
  List<String> preferiti;


  User(this._id,this.nome,this.cognome, this.email);
  
  User.fromJson(Map<String, dynamic> json)
    :
    _id = json['_id'], 
    nome = json['nome'],
    cognome = json['cognome'],
    email = json['email'],
    isMod = json['isMod'];
  
  Map<String, dynamic> toMap() 
  {
    var map = new Map<String, dynamic>();
    map["_id"] = this._id;
    map["nome"] = this.nome;
    map["cognome"] = this.cognome;
    map["email"] = this.email;
    map["isMod"] = this.isMod; 
    return map;
  }
}