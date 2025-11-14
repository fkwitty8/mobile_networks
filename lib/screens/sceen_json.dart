import 'dart:convert';

import 'package:flutter/material.dart';

class ScreenJson extends StatefulWidget {
  const ScreenJson({super.key});

  @override
  State<ScreenJson> createState() => _ScreenJsonState();
}

class _ScreenJsonState extends State<ScreenJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json screen"),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              title: Text("json"),
              onTap: () =>
              {
                obj_to_json(),
              },

            ),
            ListTile(
              title: Text("object"),
              onTap: () =>
              {
                obj_from_json(),
              },

            ),
          ],
        )
    );
  }

  Person psn = new Person();


  String person ="";
  obj_to_json() {
    psn.name="kiyimba";
    person = jsonEncode(psn);
    print(person);
  }

  obj_from_json(){

   Person p=psn.fromJson(person);
   print(p.name);
  }
}

class Person{
  String name="name";
  int age=0;

  Person fromJson(String _map){
    Map<String, dynamic>ps=jsonDecode(_map);
    Person p=new Person();
    p.name=ps["name"];
    p.age=ps["age"];

    return p;
  }
  toJson(){
    return {
      "name":name,
      "age":age,
    };
  }

}