import 'package:flutter/material.dart';
import 'package:mobile_assessment/models/movie.dart';
import 'package:sqflite/sqflite.dart';

class ScreenDatabase extends StatefulWidget {
  const ScreenDatabase({super.key});

  @override
  State<ScreenDatabase> createState() => _ScreenDatabseState();
}

class _ScreenDatabseState extends State<ScreenDatabase> {

  MovieModel my_movie=new MovieModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("create table"),
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
            SizedBox(height: 25,),
            ElevatedButton(onPressed: (){
                my_movie.table_create();
            },
                child: Text("create table")),
            SizedBox(height: 25,),
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
