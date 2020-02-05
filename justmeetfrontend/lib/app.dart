import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/utils/firebase_auth.dart';
import 'package:justmeet/utils/route_generator.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:justmeet/view/routes/areariservata.dart';
import 'package:justmeet/view/routes/eventcreator.dart';
import 'package:justmeet/view/routes/homepage.dart';
import 'package:justmeet/view/routes/homepageanonima.dart';
import 'package:justmeet/view/routes/preferiti.dart';



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
          HomePage(),
          EventCreator(),
          Preferiti(),
          AreaRiservata()];

    @override
    initState() { 
      super.initState();
    }
    
      @override
      Widget build(BuildContext context) {
         return StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged ,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot);
            if(!snapshot.hasData || snapshot.data == null){
            return MaterialApp(
              title: "JustMeet",
              theme: ThemeHandler.jmTheme(),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.generateRoute,
              home: HomepageAnonima()
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
              Icon(Icons.favorite, size: 30, color: (currentIndex==2)?ThemeHandler.jmTheme().accentColor:ThemeHandler.jmTheme().secondaryHeaderColor),
              Icon(Icons.accessible_forward, size: 30, color: (currentIndex==3)?ThemeHandler.jmTheme().accentColor:ThemeHandler.jmTheme().secondaryHeaderColor)
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





