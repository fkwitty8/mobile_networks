import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text screen"),
      ),
      body: Text("simple text",
        style: TextStyle(
          fontSize: 50,
          color: Colors.red.shade800,
          fontWeight: FontWeight.w800,
        )
      ),

    );
  }
}
