import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'contacts.dart';

class DBHelper {
  static Future<Database> initDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'contacts.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future _onCreate(Database db, int version) async {
    final sql = '''CREATE TABLE contact(
    id INTEGER PRIMARY KEY,
    name TEXT,
    contact TEXT
    )''';
    await db.execute(sql);
  }

  static Future<int> createContacts(Contact contact) async {
    Database db = await DBHelper.initDB();

    return await db.insert('contacts', contact.toJson());
  }

  static Future<List<Contact>> readContact() async {
    Database db = await DBHelper.initDB();
    var contact = await db.query('contacts', orderBy: 'name');
    List<Contact> contactList = contact.isNotEmpty
        ? contact.map((details) => Contact.fromJson(details)).toList()
        : [];
    return contactList;
  }

  static Future<int> update(Contact contact) async {
    Database db = await DBHelper.initDB();
    return await db.update('contacts', contact.toJson(),
        where: 'id = ?', whereArgs: [contact.id]);
  }

  static Future<int> deleteContacts(int id) async {
    Database db = await DBHelper.initDB();
    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }
}
