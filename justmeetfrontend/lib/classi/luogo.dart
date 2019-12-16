class Luogo{
  final String regione;
  final String provincia;
  final String comune;
  final String indirizzo;
  final String via;

  Luogo({this.regione, this.provincia, this.comune, this.indirizzo, this.via});

  factory Luogo.fromJson(Map<String, dynamic> json){
    return Luogo(
      regione: json['regione'], 
      provincia: json['provincia'], 
      comune: json['comune'],
      indirizzo: json['indirizzo'],
      via: json['via'],
    );
  }

  

}