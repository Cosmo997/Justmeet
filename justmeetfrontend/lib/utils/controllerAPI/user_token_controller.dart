
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:justmeet/model/user.dart';
import 'package:justmeet/utils/controllerjm.dart';


class UserTokenController extends ControllerJM{
  
  UserTokenController();
  static String id;
  static String token;

  /*
   * Chiamata Get con token user nell'header FUNZOINA
   */
  Future<User> getUserByIdWithToken(Future<String> idUtente, Future<String> tokenUser) async {
    id = await idUtente;
    token = await tokenUser;

    http.Response response = await http.get(getUrlBase() + "/utente/id?idUser=" +id,
    headers: {"Content-type": "application/json", "Authorization": token});
    if(response.statusCode != 200 || response.body == "[]")
    return null;
    User user = User.fromJson(jsonDecode(response.body));
    return user;
  }

  void addPreferito(Future<String> idUser, String idEvento, Future<String> tokenUser) async {
    id = await idUser;
    token = await tokenUser;
    await http.put(getUrlBase() + "/utente/addpreferiti?idUser="+id+"&idEvento="+idEvento,
    headers: {"Content-type": "application/json", "Authorization": token});
  }

  void deletePreferito(Future<String> idUser, String idEvento, Future<String> tokenUser) async {
    id = await idUser;
    token = await tokenUser;
    await http.put(getUrlBase() + "/utente/deleteprefereriti?idUser="+id+"&idEvento="+idEvento,
    headers: {"Content-type": "application/json", "Authorization": token});
  }

  Future<bool> postUser(User newuser, String token) async {
    http.Response response = await http.post(getUrlBase() + "/utente",
    headers: {"Content-type": "application/json", "Authorization": token},
    body: json.encode(newuser.toMap()));
    if(response.statusCode == 200) 
    return true;
    else 
    return false;
  }

  /*
   * Chiamate non autenticate 
   */

  Future<String> getNomeByIdUser(String idUser) async{
    http.Response response = await http.get(getUrlBase() + "/user/id/" +idUser,  headers: getHeaders());
    User user = User.fromJson(jsonDecode(response.body));
    return user.nome;
  }

  Future<User> getUserById(Future<String> idUtente) async{
    String id = await idUtente;
    http.Response response = await http.get(getUrlBase() + "/user/id/" +id,  headers: getHeaders());
    if(response.body == "[]")
    return null;
    User user = User.fromJson(jsonDecode(response.body));
    return user;
  }

  Future<bool> postUserGoogle(User newuser) async {
    http.Response response = await http.post(getUrlBase() + "/user", headers: {"Content-type": "application/json"}, body: json.encode(newuser.toMap()));
    if(response.statusCode == 200) 
    return true;
    else 
    return false;
  }

}