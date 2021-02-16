import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class Journal {
  String id;
  String date;
  String mood;
  String note;
  Journal({
    this.id,
    this.date,
    this.mood,
    this.note,
  });
}

class Database {
  List<Journal> journal;
  Database({
    this.journal,
  });

  factory Database.fromJson(Map<String, dynamic> json) => Database(
        journal: List<Journal>.from(
            json["journals"].map((x) => Journal.fromJson(x))),
      );
}

Map<String, dynamic> toJson() => {
      "journals": List<dynamic>.from(journal.map((x) => x.toJson())),
    };

class DatabaseFileRoutines {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/local_persistence.json');
  }

  Future<String> readJournals() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        print('file Doennt exist: ${file.absolute}');
        await writeJournals('{"Journals", []}');
      }
      String content = await file.readAsString();
      return content;
    } catch (e) {
      print('error while reading journals $e');
      return '';
    }
  }

  Future<File> writeJournals(String json) async {
    final file = await _localFile;
    return file.writeAsString(json);
  }

  Database databaseFromJson(String str) {
    final dataFromJson = json.decode(str);
    return Database.fromJson(dataFromJson);
  }

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        id: json["id"],
        date: json["date"],
        mood: json["mood"],
        note: json["note"],
      );

  String databaseToJson(Database data) {
    final dataToJson = data.toJson();
    return json.encode(dataToJson);
  }
}
