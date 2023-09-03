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
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);
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
  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "$myTable"(
      "$id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "$title" TEXT NOT NULL,
      "$thumbnail" TEXT NOT NULL,
      "$rating" REAL NOT NULL,
      "$price" INTEGER NOT NULL,
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


  // _onCreate(Database db, int version) async {
  //   await db.execute('''
  //     CREATE TABLE "favourites"
  //     (
  //       "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  //       "title" TEXT NOT NULL,
  //       "image" TEXT,
  //       "price" INTEGER NOT NULL
  //     )
  //   ''');
  //   print(" onCreate =====================================");
  // }

  // Future<List<Map<String, dynamic>>> readData(String sql, List<dynamic> arguments) async {
  //   Database? mydb = await db;
  //   List<Map<String, dynamic>> response = await mydb!.rawQuery(sql, arguments);
  //   return response;
  // }
  //
  // Future<int> insertData(String sql, List<dynamic> arguments) async {
  //   Database? mydb = await db;
  //   int response = await mydb!.rawInsert(sql, arguments);
  //   return response;
  // }
  //
  // Future<int> updateData(String sql, List<dynamic> arguments) async {
  //   Database? mydb = await db;
  //   int response = await mydb!.rawUpdate(sql, arguments);
  //   return response;
  // }
  //
  // Future<int> deleteData(String sql, List<dynamic> arguments) async {
  //   Database? mydb = await db;
  //   int response = await mydb!.rawDelete(sql, arguments);
  //   return response;
  // }
}
//
// deletedb()async{
//   String databasePath = await getDatabasesPath();
//   String path = join(databasePath, 'wael.db');
//   await deleteDatabase(path);
//
// }

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class SqlDb {
//
//   static Database? _db ;
//
//   Future<Database?> get db async {
//     if (_db == null){
//       _db  = await intialDb() ;
//       return _db ;
//     }else {
//       return _db ;
//     }
//   }
//
//
//   intialDb() async {
//     String databasepath = await getDatabasesPath() ;
//     String path = join(databasepath , 'wael.db') ;
//     Database mydb = await openDatabase(path , onCreate: _onCreate , version: 3  , onUpgrade:_onUpgrade ) ;
//     return mydb ;
//   }
//
//   _onUpgrade(Database db , int oldversion , int newversion ) {
//
//     print("onUpgrade =====================================") ;
//
//   }
//
//   _onCreate(Database db , int version) async {
//     await db.execute('''
//   CREATE TABLE "favourits"
//   (
//     "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT,
//     "title" TEXT NOT NULL,
//     "image" TEXT ,
//     "price" INTEGER NOT NULL,
//   )
//  ''') ;
//     print(" onCreate =====================================") ;
//
//   }
//
//   readData(String sql) async {
//     Database? mydb = await db ;
//     List<Map> response = await  mydb!.rawQuery(sql);
//     return response ;
//   }
//   insertData(String sql) async {
//     Database? mydb = await db ;
//     int  response = await  mydb!.rawInsert(sql);
//     return response ;
//   }
//   updateData(String sql) async {
//     Database? mydb = await db ;
//     int  response = await  mydb!.rawUpdate(sql);
//     return response ;
//   }
//   deleteData(String sql) async {
//     Database? mydb = await db ;
//     int  response = await  mydb!.rawDelete(sql);
//     return response ;
//   }
//
//
// // SELECT
// // DELETE
// // UPDATE
// // INSERT
//
//
// }