import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.sentiment_dissatisfied, size: 50, color: Colors.white,),
                  Text("Non sono presenti eventi in questa sezione.")
                ],
              ),
            ),
          );
  }
}