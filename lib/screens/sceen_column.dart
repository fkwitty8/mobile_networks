import 'package:flutter/material.dart';

class ScreenColumn extends StatelessWidget {
  const ScreenColumn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Row screen"),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
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
