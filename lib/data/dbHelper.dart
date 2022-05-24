import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class DbHelper {
  final Future<Database> database = getDatabasesPath().then((String path) {
    return openDatabase(join(path, 'countries.db'), onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user(id TEXT PRIMARY KEY,imageUrl TEXT NOT NULL,nickName TEXT NOT NULL)',
      );
    }, version: 1);
  });

  Future<void> insertTask(User user) async {
    Database db = await database;
    await db.insert('user', user.toMap());
  }

  Future<List<User>> users() async {
    final db = await database;
    List<Map<String, dynamic>> users = await db.query('user');
    return !users.isEmpty
        ? List.generate(users.length, (index) {
            return User(
                id: users[index]['id'],
                imageUrl: users[index]['imageUrl'],
                nickName: users[index]['nickName']);
          })
        : [];

  }

  Future<void> deleteUser(String id) async {
    final db = await database;
    await db.delete(
      'user',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}
