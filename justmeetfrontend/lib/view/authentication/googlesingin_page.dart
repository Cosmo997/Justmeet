import 'package:flutter/material.dart';
import 'package:justmeet/model/user.dart';
import 'package:justmeet/utils/controllerAPI/user_token_controller.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SinginGooglePage extends StatefulWidget {
  final String id;

  SinginGooglePage({Key key, this.id}) : super(key: key);



  @override
  _SinginGooglePageState createState() => _SinginGooglePageState(this.id);
}

class _SinginGooglePageState extends State<SinginGooglePage> {
    final String id;
    UserTokenController userTokenController = new UserTokenController();
    TextEditingController nome = new TextEditingController();
    TextEditingController cognome = new TextEditingController();
    TextEditingController email = new TextEditingController();
    User newuser;
    bool esito;

  _SinginGooglePageState(this.id);

  @override
  Widget build(BuildContext context) {
    
        return Container(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Nome
                TextField(
                 decoration: InputDecoration(
                                  labelText: 'Nome',
                                  hintText: "Inserisci qui il tuo nome",
                                  border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8),)),
                                 ),
                  controller: nome,
                ),
                //Cognome
                TextField(
                  decoration: InputDecoration(
                                  labelText: 'Cognome',
                                  hintText: "Inserisci qui il tuo cognome",
                                  border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8),)),
                                 ),
                  controller: cognome,
                ),
                //Email
                TextField(
                  decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: "Inserisci qui la tua Email",
                                  border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8),)),
                                 ),
                  controller: email,
                ),
                SignInButton(
                  Buttons.Google, 
                  onPressed: () async => {
                    newuser = new User(id, nome.text, cognome.text, email.text),
                    this.esito = await userTokenController.postUserGoogle(newuser),
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: <Widget>[
                            RaisedButton.icon(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back), label: Text("Indietro"))
                          ],
                          title: Text("Congratulazioni, sei iscritto a JustMeet",

                        ),
                        );
                      },
                      )
              })

          ],
        ),
      )
    );
  }
}