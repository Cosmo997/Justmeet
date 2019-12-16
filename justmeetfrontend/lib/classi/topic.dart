class Topic{

  final String argomento;

  Topic({this.argomento});

  factory Topic.fromJson(Map<String, dynamic> json){
    return Topic(argomento: json['argomento']);
  }

}