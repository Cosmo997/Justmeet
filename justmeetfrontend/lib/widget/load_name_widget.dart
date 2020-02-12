import 'package:flutter/cupertino.dart';
import 'package:justmeet/utils/controllerAPI/user_controller.dart';
import 'package:justmeet/utils/theme.dart';

class LoadName extends StatefulWidget{
  const LoadName({Key key, @required this.idCreatore}) : super(key: key);


  @override
  LoadNameState createState() => LoadNameState(this.idCreatore); 
  final String idCreatore;

  }

  class LoadNameState extends State<LoadName>{
  final String idCreatore;
  UserController userController = new UserController();

  LoadNameState(this.idCreatore);

  @override
  Widget build(BuildContext context) {
   
    return FutureBuilder(
                future: userController.getNomeByIdUser(this.idCreatore),
                builder: (context, AsyncSnapshot<String> nome){
                if(nome.data == null){
                   return Text("Loading...", style: TextStyle(color: ThemeHandler.jmTheme().accentColor));
                }else{
                    return Text("Creatore: " +nome.data);
                }
                }
                );
  }
}