import 'dart:convert';

import 'package:justmeet/model/topic.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:http/http.dart' as http;

class TopicController extends ControllerJM{
  
  TopicController();

  Future<List<Topic>> loadTopics() async {
    http.Response response = await http.get(getUrlBase() + "/topics", headers: {"Accept" : "application/json"});
    List collection = json.decode(response.body);
    List<Topic> topic = collection.map((json) => Topic.fromjson(json)).toList();
    return topic;
  }


}