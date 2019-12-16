import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: 
      MyHomePage(title: 'Test Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  }


class _MyHomePageState extends State<MyHomePage> {
 
  Utente utente = Utente();
  
  TextEditingController usrController = TextEditingController();
  TextEditingController pswController = TextEditingController();

  bool isLoginDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)), 
        
      body: Center(

        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    labelText: 'Username',

                    icon: Icon(Icons.account_box),                    

                ),

                controller: usrController,

                //onChanged: _formChanged,

              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    labelText: 'Password',

                    icon: Icon(Icons.visibility_off),

                ),

                controller: pswController,
                onChanged: _formChanged,
                obscureText: true,

              ),
            ),

            RaisedButton(
             child: Text('Login'),
             onPressed: isLoginDisabled ? null : _loginPressed,
           )

          ],
        )
      ),
    ); 
  } //build context

  void _loginPressed() {
   setState(() {
    utente.username = usrController.text;
    utente.password = pswController.text;
   });
  } 
   
  void _formChanged(String value) {
   setState(() {
    isLoginDisabled = (usrController.text.isEmpty || pswController.text.isEmpty);
   });
  }



  @override
  void initState() {
    super.initState();
    usrController.addListener(formOnChanged);
    usrController.addListener(removeSomeChar);
    pswController.addListener(formOnChanged);
  }   



void formOnChanged() {
    setState(() {
      isLoginDisabled =
          (usrController.text.length == 0 || pswController.text.length == 0);
    });
  }
    
    
    
    
    void removeSomeChar() {
    
    final text = usrController.text
        .toLowerCase()
        .replaceAll("@", "")
        .replaceAll("#", "");
    
    usrController.value = usrController.value.copyWith(
      text: text,
      selection:
          TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );    
  }

  @override
  void dispose() {
    usrController.dispose();
    pswController.dispose();
    super.dispose();
  }  
}


class Utente {
 String username;
 String password;
}
