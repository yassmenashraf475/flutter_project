import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqflite {
  static Database? _db;

  Future<Database?> get dB async {
    _db ??= await initialDB();
    return _db;
  }

  initialDB() async {
    String databasePath = await getDatabasesPath();
    String databaseName = "favproduct.db";
    String path = join(databasePath, databaseName);
    Database Dbproduct = await openDatabase(path,
        onCreate: _onCreate, version: 8, onUpgrade: _onUpgrade);
    return Dbproduct;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("onUpgrade =====================================");
  }

  final myTable = "product";
  final id = "id";
  final title = "title";
  final thumbnail = "thumbnail";
  final rating = "rating";
  final price = "price";
  final description = "description";
  final discountPercentage = "discountPercentage";
  final stock = "stock";
  final brand = "brand";
  final category = "category";
  final images = "images";
  final isColored = "isColored";
  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "$myTable"(
      "$id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "$title" TEXT NOT NULL,
      "$thumbnail" TEXT NOT NULL,
      "$rating" REAL NOT NULL,
      "$price" INTEGER NOT NULL,
      "$isColored" INTEGER DEFAULT 0 NOT NULL
      )
    ''');
    print("Create=======================");
  }

    myInsert(String table, Map<String, Object?> values) async {
      Database? myDb = await dB;
      int response = await myDb!.insert(table, values);
      return response;
    }

    // Read
    myRead(String table) async {
      Database? myDb = await dB;
      List<Map> response = await myDb!.query(table);
      return response;
    }

    // Update
    myUpdate(String table, Map<String, Object?> values, String myWhere) async {
      Database? myDb = await dB;
      int response = await myDb!.update(table, values, where: myWhere);
      return response;
    }

    // Delete
    myDelete(String table, String myWhere) async {
      Database? myDb = await dB;
      int response = await myDb!.delete(table, where: myWhere);
      return response;

  }


}
