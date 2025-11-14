import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenToast extends StatefulWidget {
  const ScreenToast({super.key});
  @override
  State<ScreenToast> createState() => _ScreenToastState();
}

class _ScreenToastState extends State<ScreenToast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("toast screen"),
      ),
      body: Column(
          children:[
            InkWell(
                onTap: ()=>{
                  make_toast()
                },
                child: Text("my toast component")),
          ]


    )
    );
  }

  make_toast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }
}
