import 'package:flutter/material.dart';

import '../widgets/my_widget.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Row screen"),
        ),
        body: ListView(
          children: [
            single_list_items("Uganda","Kampala" ),
            single_list_items("Rwanda", "Kigali"),
          ],
        )
    );
  }
}


