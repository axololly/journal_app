import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:sqlite3/sqlite3.dart';

// A helper 
class JournalEntryDetails {
  final int journalID;
  final DateTime dateWrittenFor;
  final DateTime whenLastEdited;
  final String content;

  const JournalEntryDetails({
    required this.journalID,
    required this.dateWrittenFor,
    required this.whenLastEdited,
    required this.content
  });

  @override
  String toString() {
    return "<JournalEntryDetails id=$journalID dateWrittenFor=$dateWrittenFor whenLastEdited=$whenLastEdited content=$content>";
  }
}

class Loader {
  static List<JournalEntryDetails> entries = [];

  static void init() {
    var file = File('.diaries.sql');

    // If the SQL file doesn't exist, then create it
    if (!file.existsSync()) {
      file.createSync();
    }

    Database db = sqlite3.open('.diaries.sql');

    // Create the tables required, automatically skipping
    // them if they're already present.
    db.execute("""
      
      CREATE TABLE IF NOT EXISTS entries (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date_written_for INT NOT NULL,
        when_last_edited INT NOT NULL,
        content TEXT NOT NULL
      );

      CREATE TABLE IF NOT EXISTS cache (
        id INTEGER,
        FOREIGN KEY (id) REFERENCES entries(id)
      );

    """);

    // Get a list of column names in the `entries` table
    List<String> columnNames = db
      .select("PRAGMA table_info(entries)")
      .map((row) => "${row['name']}")
      .toList();
    
    List<String> correctNames = [
      "id",
      "date_written_for",
      "when_last_edited",
      "content"
    ];

    // Check that all the column names are as they should be.
    if (!listEquals(columnNames, correctNames)) {
      // This will trigger if someone pokes around in the database file, or if
      // I'm stupid enough to not remember to update it with coming updates.
      throw Exception("column names are inconsistent and do not match the pre-defined schema.");
    }

    // If the cache table is empty, insert a row
    // with a NULL value as a placeholder.
    if (db.select("SELECT * FROM cache").isEmpty) {
      db.execute("INSERT INTO cache (id) VALUES (NULL)");
    }

    // Fetch all the entries and translate them
    // into `JournalEntryDetails` objects.
    entries = db
      .select("SELECT * FROM entries")
      .map(
        (row) {
          return JournalEntryDetails(
            journalID: row['id'],
            dateWrittenFor: DateTime.fromMillisecondsSinceEpoch(row['date_written_for' ] * 1000),
            whenLastEdited: DateTime.fromMillisecondsSinceEpoch(row['when_last_edited'] * 1000),
            content: row['content']
          );
        }
      )
      .toList();
  }
}