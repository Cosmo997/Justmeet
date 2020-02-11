import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/utils/auth_provider.dart';
import 'package:justmeet/utils/route_generator.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:justmeet/view/routes/areariservata_page.dart';
import 'package:justmeet/view/routes/creaevento_page.dart';
import 'package:justmeet/view/routes/ricerca_page.dart';
import 'package:justmeet/view/routes/user_home_page.dart';
import 'package:justmeet/view/routes/guest_home_page.dart';

void main() => runApp(App());

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
        static FirebaseUser currentUser;
        int currentIndex = 0;
        final pageOption = [
          UserHomePage(),
          CreaEventoPage(),
          RicercaPage(),
          AreaRiservataPage()];

    @override
    initState() { 
      super.initState();
    }
    
      @override
      Widget build(BuildContext context) {
         return StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged ,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(!snapshot.hasData || snapshot.data == null){
            return MaterialApp(
              title: "JustMeet",
              theme: ThemeHandler.jmTheme(),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.generateRoute,
              home: GuestHomePage()
            );
            }
            else{
            return MaterialApp(
          title: "JustMeet",
          theme: ThemeHandler.jmTheme(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
           home: Scaffold(
     //App bar generale
           appBar:AppBar(
               backgroundColor: ThemeHandler.jmTheme().primaryColor,
               elevation: 10,
               title: Image.asset('assets/images/logo.png', scale: 2.5),
               centerTitle: true,
               actions: <Widget>[
                 IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.exit_to_app),
                    onPressed:() => AuthProvider().logOut(),
                    tooltip: "LogOut",
                    color: ThemeHandler.jmTheme().accentColor,
                  ),
               ],
               ),
    
     //Body = richiama il metodo costruttore Build della pagina all'indice currentIndex
    
           body: pageOption[currentIndex],
    
     //Navigation Bar Generale
    
           bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            color: ThemeHandler.jmTheme().primaryColor,
            backgroundColor: Colors.black.withOpacity(0),
            buttonBackgroundColor: ThemeHandler.jmTheme().primaryColor,  
            items: [
              Icon(Icons.home, size: 30,color: (currentIndex==0)?ThemeHandler.jmTheme().accentColor:ThemeHandler.jmTheme().secondaryHeaderColor),
              Icon(Icons.add_circle, size: 30, color: (currentIndex==1)?ThemeHandler.jmTheme().accentColor:ThemeHandler.jmTheme().secondaryHeaderColor),
              Icon(Icons.search, size: 30, color: (currentIndex==2)?ThemeHandler.jmTheme().accentColor:ThemeHandler.jmTheme().secondaryHeaderColor),
              Icon(Icons.account_circle, size: 30, color: (currentIndex==3)?ThemeHandler.jmTheme().accentColor:ThemeHandler.jmTheme().secondaryHeaderColor)
            ],
            animationDuration: Duration(milliseconds: 700),
            index: currentIndex,
            onTap: (index){setState(() {
              currentIndex = index;
            });})
            
      ),
          );
          }
          },
        );
        
}

}





