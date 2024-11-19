import 'dart:async';
import 'package:pas_project/model/PostModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('favorites.db');  
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,  
    );
  }

  Future _createDB(Database db, int version) async {
    const tableName = 'favorites';
    await db.execute(''' 
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        strTeam TEXT NOT NULL,
        strBadge TEXT NOT NULL,
        strDescriptionEN TEXT,
        intFormedYear TEXT,
        strLeague TEXT,
        strStadium TEXT,
        strLocation TEXT
      )
    ''');
  }

  Future<void> addFavorite(PostModel post) async {
    final db = await instance.database;
    await db.insert('favorites', {
      'strTeam': post.strTeam,
      'strBadge': post.strBadge,
      'strDescriptionEN': post.strDescriptionEN,
      'intFormedYear': post.intFormedYear,
      'strLeague': post.strLeague,
      'strStadium': post.strStadium,
      'strLocation': post.strLocation,
    });
  }

  Future<List<PostModel>> getFavorites() async {
    final db = await instance.database;
    final result = await db.query('favorites');
    return result.map((json) => PostModel.fromJson(json)).toList();
  }

  Future<void> removeFavorite(String teamName) async {
    final db = await instance.database;
    await db.delete('favorites', where: 'strTeam = ?', whereArgs: [teamName]);
  }
}

