import 'package:flutter/material.dart';
import 'package:justmeet/utils/theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
             child: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text("LOADING", style: TextStyle(
                     color: ThemeHandler.jmTheme().accentColor),),
                   Divider(color: ThemeHandler.jmTheme().accentColor, height: 30,indent: 50 ,endIndent: 50,),
                   CircularProgressIndicator(),
                 ],
               ),
                 )
     );
  }
}