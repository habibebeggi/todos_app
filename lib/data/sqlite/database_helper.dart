import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String dbName = "todos_app.sqlite";

  static Future<Database> veritabaniErisim() async {
    String dbPath = join(await getDatabasesPath(), dbName);

    if(await databaseExists(dbPath)){
      print("Veritabanı zaten var, kopyalamaya gerek yok! ");
    }else{
      ByteData data = await rootBundle.load("database/$dbName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes, flush: true);
      print("Veritabanı kopyalandı.");
    }

    return openDatabase(dbPath);
  }
}