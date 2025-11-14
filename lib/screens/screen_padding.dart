import 'package:flutter/material.dart';

class ScreenPadding extends StatelessWidget {
  const ScreenPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("padding screen"),
      ),
      body: Padding(
          child: Text("my padding component"),
          padding: EdgeInsets.only(top: 100))

    );
  }
}
