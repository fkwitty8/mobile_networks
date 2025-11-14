import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile_assessment/models/movie.dart';
import 'package:mobile_assessment/models/my_constants.dart';
import 'package:sqflite/sqflite.dart';

class ScreenDatabaseInsert extends StatefulWidget {
  const ScreenDatabaseInsert({super.key});

  @override
  State<ScreenDatabaseInsert> createState() => _ScreenDatabaseInsertState();
}

class _ScreenDatabaseInsertState extends State<ScreenDatabaseInsert> {

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
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [
                FormBuilderTextField(
                  name: "title",
                  onChanged: (x){
                    my_movie.title=x.toString();
                    setState(() {

                    });

                  },
                  decoration: InputDecoration(
                    labelText: "title",
                    icon: Icon(Icons.person),
                    helperText: "movie title",
                    helperStyle: TextStyle(color: Colors.blue,),
                    iconColor: Colors.blue,
                    filled: true,
                    fillColor: Colors.blueGrey,

                  ),
                  textAlign: TextAlign.left,
                ),

                FormBuilderDropdown<String>(
                    name: "category",
                    decoration: InputDecoration(
                      labelText: "category",
                      icon: Icon(Icons.person),
                      helperText: "movie category",
                      helperStyle: TextStyle(color: Colors.blue,),
                      iconColor: Colors.blue,
                      filled: true,
                      fillColor: Colors.blueGrey,

                    ),
                  items: AppConfig.movie_categories
                      .map((gender) => DropdownMenuItem(
                    alignment: AlignmentDirectional.center,
                    value: gender,
                    child: Text(gender),
                  ))
                      .toList(),
                ),

                SizedBox(height: 25,),

                ElevatedButton(onPressed: (){
                  save_movie();
                },
                    child: Text("save movie")),
              ],
            ),
          ),
        )
    );
  }

  void save_movie() {

    my_movie.save();
    _formKey.currentState!.reset();
    return;
  }
}
