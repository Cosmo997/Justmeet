import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SinginSelection extends StatelessWidget {
  const SinginSelection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Container(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Registrazione con google
                SignInButton(
                  Buttons.Google,
                  text: "Registrati con Google",
                  mini: false,
                  onPressed: () => 
                Navigator.of(context).pushNamed("/googlesingin"),
              ),
               //Registrazione con email
                FlatButton(
                  child: Text("registrati con email e password"),
                  onPressed: () => Navigator.of(context).pushNamed("/singin"),
                )

          ],
        ),
      )
    );
  }
}