

class Topic{

   String argomento;
   int _id;

	

  
  Topic(this._id, this.argomento);

  Topic.fromjson(Map<String, dynamic> json)
  : 
  _id = json['_id'],
  argomento = json['argomento'];

  int getId() {
		return this._id;
	}

	void setId(int _id) {
		this._id = _id;
	}
  
}