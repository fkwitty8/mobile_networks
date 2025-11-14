import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile_assessment/models/movie.dart';
import 'package:mobile_assessment/models/my_constants.dart';
import 'package:sqflite/sqflite.dart';

class ScreenDatabaseSelect extends StatefulWidget {
  const ScreenDatabaseSelect({super.key});

  @override
  State<ScreenDatabaseSelect> createState() => _ScreenDatabaseSelectState();
}

class _ScreenDatabaseSelectState extends State<ScreenDatabaseSelect> {

  MovieModel my_movie=new MovieModel();
  final _formKey=GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${my_movie.title}"),
        ),
        body: Container(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                Text("movies from tables"),
                ElevatedButton(onPressed: (){
                  get_movie();
                },
                    child: Text("get movie")),
              ],
            )
          ),
        )
    );
  }

  void get_movie() {
    print("get movie");
    return;
  }
}
