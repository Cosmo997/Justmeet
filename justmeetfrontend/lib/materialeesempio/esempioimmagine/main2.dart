import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  MyHomePage(title: 'Image Demo'),
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
 int width;
 int height;
 double devicePixelRatio;
 String aspectRatio;
 Orientation orientation;

 @override
 void didChangeDependencies() {

   width = MediaQuery.of(context).size.width.toInt();
   height = MediaQuery.of(context).size.height.toInt();
   devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
   aspectRatio = MediaQuery.of(context).size.aspectRatio.toStringAsFixed(4);
   orientation = MediaQuery.of(context).orientation;
   super.didChangeDependencies();
 }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text(widget.title)), 
        
  //     body: Container(        
  //       child: 
  //         Image.network(
  //           "https://picsum.photos/id/111/1080/1080", 
  //           width: 350, height: 700,
  //         ),      
  //     ),
  //   ); 
  // } //build context


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)), 
        
      body: (width < 420) ?	mobileLayout(context, null) :
	          (width < 601 ? 	middleLayout(context, null) :
		        tabletLayout(context, null))
,
    ); 
  } //build context
  
  mobileLayout(context, constraints)
  {
    return 
        Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),

            child: DecoratedBox(
             decoration: BoxDecoration(
               border: Border.all(width: 1),
               borderRadius: BorderRadius.all(Radius.circular(6.0)),
             ),
             child: Padding(
               padding: EdgeInsets.all(8),
               child: Column(
                 children: <Widget>[
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Column(children: <Widget>[Text("Width:"), Text("Height")]),
                       Column(children: <Widget>[Text(width.toString()), Text(height.toString())]),
                       Column(children: <Widget>[Text("PR:"), Text("AR:")]),
                       Column(children: <Widget>[Text(devicePixelRatio.toString()), Text(aspectRatio)]),
                       ]
                       ),

                       Text(orientation.toString()),                                            
                     ],
                   )
                 ,)             
               ), 
            ),

          Image.network(
            "https://picsum.photos/id/111/1080/1080", 
          ),

        ],        
      );
  }

  middleLayout(context, constraints)
  {
    return null;
  }

  tabletLayout(context, constraints)
  {
    return null;
  }

}
