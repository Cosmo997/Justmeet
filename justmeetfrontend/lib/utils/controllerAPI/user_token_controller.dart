
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:justmeet/model/user.dart';
import 'package:justmeet/utils/controllerjm.dart';


class UserTokenController extends ControllerJM{
  
  UserTokenController();

  /*
   * Chiamata Get con token user nell'header 
   */
  Future<User> getUserByIdWithToken(Future<String> idUtente, Future<String> tokenUser) async {
    String id = await idUtente;
    String token = await tokenUser;

    http.Response response = await http.get(getUrlBase() + "/utenti/id/" +id, headers: {"Content-type": "application/json", "Authorization": token});
    if(response.statusCode != 200 || response.body == "[]")
    return null;
    User user = User.fromJson(jsonDecode(response.body));
    return user;
  }

}