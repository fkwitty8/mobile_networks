import 'package:flutter/material.dart';

class ScreenImage extends StatelessWidget {
  const ScreenImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image screen"),
        ),
        body: Column(
          children: [
           Image(image: AssetImage("assets/images/1.png")),
            //Image(image: NetworkImage(url))
          ],
        )
    );
  }
}
