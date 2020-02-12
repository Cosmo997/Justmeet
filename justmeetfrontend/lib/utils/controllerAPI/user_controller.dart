
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:justmeet/model/user.dart';
import 'package:justmeet/utils/controllerjm.dart';


class UserController extends ControllerJM{
  UserController();

  Future<bool> postUser(User newuser) async {
    print("Json.encode: " +json.encode(newuser.toMap()));
    http.Response response = await http.post(getUrlBase() + "/user", headers: {"Content-type": "application/json"}, body: json.encode(newuser.toMap()));
    print("Status code: " +response.statusCode.toString());
    if(response.statusCode == 200) 
    return true;
    else 
    return false;

  }

  Future<User> getUserById(Future<String> idUtente) async {
    String id = await idUtente;
    http.Response response = await http.get(getUrlBase() + "/user/id/" +id,  headers: getHeaders());
    User user = User.fromJson(jsonDecode(response.body));
    return user;
  }

  void addPreferito(Future<String> idUser, String idEvento) async {
    String id = await idUser;
    await http.put(getUrlBase() + "/user/addpreferiti?idUser="+id+"&idEvento="+idEvento);
  }

  void deletePreferito(Future<String> idUser, String idEvento) async {
    String id = await idUser;
    await http.put(getUrlBase() + "/user/deletepreferiti?idUser="+id+"&idEvento="+idEvento);
  }

    Future<String> getNomeByIdUser(String idUser) async{
    http.Response response = await http.get(getUrlBase() + "/user/id/" +idUser,  headers: getHeaders());
    User user = User.fromJson(jsonDecode(response.body));
    return user.nome;
  }


}