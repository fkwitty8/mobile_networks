import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ScreenForm extends StatefulWidget {
  const ScreenForm({super.key});

  @override
  State<ScreenForm> createState() => _ScreenFormState();
}

class _ScreenFormState extends State<ScreenForm> {

  int age=10;
  final _formkey=GlobalKey<FormBuilderState>;

  incr(){
    age++;
    setState(() {

    });
  }

  decr(){
    age--;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("padding screen"),
      ),
      // body: Column(
      //   children: [
      //
      //     InkWell(
      //       onTap: ()=>{
      //         incr()
      //       },
      //
      //       child: Padding(
      //         padding: const EdgeInsets.all(24),
      //         child: Text("Increase"),
      //       ),
      //     ),
      //
      //     Padding(
      //       padding: const EdgeInsets.all(24),
      //       child: Text("im ${age} years old",
      //       style: TextStyle(color: Colors.blue,fontSize: 24)),
      //     ),
      //     InkWell(
      //       onTap: ()=>{
      //         incr()
      //       },
      //
      //       child: Padding(
      //         padding: const EdgeInsets.all(24),
      //         child: Text("decrease"),
      //       ),
      //     ),
      //
      //   ],
      // )
      body:SingleChildScrollView(
        child: Column(
          children: [
            FormBuilder(
                child: Column(
              children: [
                FormBuilderTextField(
                    name: "first name",
                    decoration: InputDecoration(
                      labelText: "first name",
                        icon: Icon(Icons.person),iconColor: Colors.blue
                    ),
                ),
                SizedBox(
                  height: 15,
                ),
                FormBuilderTextField(
                  name: "last name",
                  decoration: InputDecoration(
                      labelText: "last name",
                    icon: Icon(Icons.person),
                    helperText: "middle name",
                    helperStyle: TextStyle(color: Colors.blue,),
                    prefix: Text("hello"),
                    iconColor: Colors.blue,
                    filled: true,
                    fillColor: Colors.black54,

                  ),
                  textAlign: TextAlign.center,


                ),
                FormBuilderTextField(
                  name: "password",
                  decoration: InputDecoration(
                      labelText: "last name",
                      icon: Icon(Icons.person)
                  ),
                  obscureText:true ,

                ),
                SizedBox(
                  height: 15,
                ),

                FormBuilderDateTimePicker(name:"dob")
              ],
            )

            )

          ],
        ),
      ),
    );
  }
}
