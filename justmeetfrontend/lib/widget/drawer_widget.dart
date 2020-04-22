import 'package:flutter/material.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:justmeet/view/authentication/singin_page.dart';

class JMDrawer extends StatelessWidget {
  const JMDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 20,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.yellow,
                  ThemeHandler.jmTheme().accentColor,
                  Colors.orange,
                ],
                stops: [0.5,0.5,0.5],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
                )
              ),
              child:  Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset('assets/images/iconaverticale.png', scale: 2),
                    ),
                  ],
                )),),
           ListTile(
              title: Text("Login",style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.person, color: ThemeHandler.jmTheme().accentColor,),
              trailing:  Icon(Icons.arrow_forward_ios, color: ThemeHandler.jmTheme().accentColor,),
              onTap: () {
                showModalBottomSheet(
       context: context,
       builder: (BuildContext context) { return FractionallySizedBox(
         heightFactor: 0.9,
         child: SinginPage()); },
       isScrollControlled: true);
              },
            ),
            ListTile(
              title: Text("SignUp",style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.people, color: ThemeHandler.jmTheme().accentColor,),
              trailing:  Icon(Icons.arrow_forward_ios, color: ThemeHandler.jmTheme().accentColor,),
              onTap: () {
                Navigator.of(context).pushNamed('/signup');
              },
            ),
            ListTile(
              title: Text("Crea Evento",style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.add_circle, color: ThemeHandler.jmTheme().accentColor,),
              trailing:  Icon(Icons.arrow_forward_ios, color: ThemeHandler.jmTheme().accentColor,),
              onTap: () {
                showModalBottomSheet(
       context: context,
       builder: (BuildContext context) {
          return FractionallySizedBox(
         heightFactor: 0.9,
         child: SinginPage()); },
       isScrollControlled: true);
              },
            ),
             ListTile(
              title: Text("I Miei Eventi",style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.calendar_today, color: ThemeHandler.jmTheme().accentColor,),
              trailing:  Icon(Icons.arrow_forward_ios, color: ThemeHandler.jmTheme().accentColor,),
              onTap: () {
                showModalBottomSheet(
       context: context,
       builder: (BuildContext context) { return FractionallySizedBox(
         heightFactor: 0.9,
         child: SinginPage()); },
       isScrollControlled: true);
              },
            ),
            ListTile(
              title: Text("Preferiti",style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.favorite, color: ThemeHandler.jmTheme().accentColor,),
              trailing:  Icon(Icons.arrow_forward_ios, color: ThemeHandler.jmTheme().accentColor,),
              onTap: () {
                showModalBottomSheet(
       context: context,
       builder: (BuildContext context) { return FractionallySizedBox(
         heightFactor: 0.9,
         child: SinginPage()); },
       isScrollControlled: true);
              },
            ),
            ListTile(
              title: Text("Area Riservata",style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.account_circle, color: ThemeHandler.jmTheme().accentColor,),
              trailing:  Icon(Icons.arrow_forward_ios, color: ThemeHandler.jmTheme().accentColor,),
              onTap: () {
                showModalBottomSheet(
       context: context,
       builder: (BuildContext context) { return FractionallySizedBox(
         heightFactor: 0.9,
         child: SinginPage()); },
       isScrollControlled: true 
       );
              },
            ),
            ListTile(
              title: Text("Settings",style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.settings, color: ThemeHandler.jmTheme().accentColor,),
              trailing:  Icon(Icons.arrow_forward_ios, color: ThemeHandler.jmTheme().accentColor,),
              onTap: () {
              },
            ),
          ],
        ),
      );
  }
}