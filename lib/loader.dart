import 'dart:io';
import 'package:sqlite3/sqlite3.dart';

class Loader {
  late Database db;

  Loader.init() {
    var file = File('./.diaries.sql');

    // If the SQL file doesn't exist, then create it
    if (!file.existsSync()) {
      file.createSync();
    }

    db = sqlite3.open(file.path);

    // Create the tables required
    db.execute("""
      
      ...

    """);
  }
}