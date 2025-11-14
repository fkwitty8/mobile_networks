import 'package:flutter/material.dart';
import 'package:mobile_assessment/screens/database/sceen_database_create.dart';
import 'package:mobile_assessment/screens/database/sceen_database_insert.dart';
import 'package:mobile_assessment/screens/sceen_column.dart';
import 'package:mobile_assessment/screens/sceen_image.dart';
import 'package:mobile_assessment/screens/sceen_json.dart';
import 'package:mobile_assessment/screens/screen_container.dart';
import 'package:mobile_assessment/screens/screen_form.dart';
import 'package:mobile_assessment/screens/screen_list.dart';
import 'package:mobile_assessment/screens/screen_padding.dart';
import 'package:mobile_assessment/screens/screen_row.dart';
import 'package:mobile_assessment/screens/screen_toast.dart';
import 'package:mobile_assessment/screens/text_screen.dart';

void main() {
  runApp(const MyApp());// calling the material app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my simple app",
      home:HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("Home Page"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("container"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TextScreen()))
              },
            ),
            ListTile(
              title: Text("text"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TextScreen()))
              },
            ),
            ListTile(
              title: Text("padding"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenPadding()))
              },
            ),
            ListTile(
              title: Text("Row"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenRow()))
              },
            ),
            ListTile(
              title: Text("column"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenColumn()))
              },
            ),
            ListTile(
              title: Text("list"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenList()))
              },
            ),
            ListTile(
              title: Text("images"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenImage()))
              },
            ),
            ListTile(
              title: Text("Form"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenForm()))
              },
            ),
            ListTile(
              title: Text("Toast"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenToast()))
              },
            ),
            ListTile(
              title: Text("json"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.chevron_right),
              subtitle: Text("json data type"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenJson()))
              },
            ),
            ListTile(
              title: Text("db table create"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.chevron_right),
              subtitle: Text("creating tables"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenDatabase()))
              },
            ),

            ListTile(
              title: Text("db table insert"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.chevron_right),
              subtitle: Text("insert tables"),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenDatabaseInsert()))
              },
            ),

          ],
        ),

      ),
    );
  }
}
