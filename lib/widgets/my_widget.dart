
import 'package:flutter/material.dart';

Widget single_list_items(String title,String caption ){
  return Container(
    padding: EdgeInsets.only(left: 16,top:16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${title}",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 24
          ),
        ),
        Text("${caption}",
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.blueGrey,
              fontSize: 16
          ),
        ),
      ],
    ),
  );
}