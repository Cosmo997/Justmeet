
class User
{
  String nome;
  String cognome;
  String username;

  User(this.nome,this.cognome,this.username);

//GETTER and SETTER

	String getNome() {
		return this.nome;
	}

	void setNome(String nome) {
		this.nome = nome;
	}

	String getCognome() {
		return this.cognome;
	}

	 void setCognome(String cognome) {
		this.cognome = cognome;
	}

	String getUsername() {
		return this.username;
	}

	void setUsername(String username) {
		this.username = username;
	}

  
  User.fromJson(Map<String, dynamic> json)
    : username = json['username'],
    nome = json['nome'],
    cognome = json['cognome'];
  
}