//import 'dart:convert';
//import 'dart:js_util';

class Topic{

   String argomento;
   String id;
  
  Topic(this. id, this.argomento);

  Topic.fromJson(Map<String, dynamic> json)
  : 
  id = json['id'],
  argomento = json['argomento'];

/*
  factory Topic.fromJson(Map<String, dynamic> json){
    return Topic(id: json['id'],argomento: json['argomento']);
  }
  */

}