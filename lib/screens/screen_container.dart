import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("screen screen"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("my container component",
              style: TextStyle(color:Colors.white70)
            ),
          ),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.only(bottomLeft:Radius.elliptical(50, 50) )
          ),

        ),

    );
  }
}
