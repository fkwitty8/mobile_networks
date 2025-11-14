import 'package:flutter/material.dart';

class ScreenRow extends StatelessWidget {
  const ScreenRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Row screen"),
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
        children: [
          Container(
    height: 62,
    width: 62,
    color: Colors.black87,
    ),
    Container(
    height: 62,
    width: 62,
    color: Colors.yellow,
    ),
    Container(
    height: 62,
    width: 62,
    color: Colors.green,
    )
    ],
    )
    );
  }
}
