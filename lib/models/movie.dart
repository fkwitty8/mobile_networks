import 'package:flutter/cupertino.dart';
import 'package:mobile_assessment/models/my_constants.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class MovieModel{
  static const String TABLE_NAME="movie";
  int id=0;
  String title="";
  String category="";

 save() async {
    bool success=false;
    database_Factory_Ffi();

    var db=await openDatabase(AppConfig.LOCAL_DB_PATH);
    if (!db.isOpen){
      print("db failed to open");
      return;
    }

    try{
    int record_number=await db.insert(TABLE_NAME, this.toJson());
    print("record no ${record_number} saved successfully!");
    success=true;
    return ;
    }catch(e){
      print(e);
    }

  }

  table_create() async {

    database_Factory_Ffi();

    var db=await openDatabase(AppConfig.LOCAL_DB_PATH);
    if (!db.isOpen){
      print("db failed to open");
      return;
    }
    try {
      await db.execute(
          " create table if not exists ${MovieModel
              .TABLE_NAME}(id integer primary key autoincrement, tittle text, category text)"
      );
      print("created successfull");
    }catch (e){
      print(e);
    }
  }

  database_Factory_Ffi(){
    if (kIsWeb) {
      // CRITICAL: Set the database factory to the Web implementation
      databaseFactory = databaseFactoryFfiWeb;

    } else if (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      // This is the CRITICAL line for Desktop platforms:
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    WidgetsFlutterBinding.ensureInitialized();
    return;
  }

  toJson(){
    return{
      "tittle":this.title,
      "category":this.category
    };
  }
}