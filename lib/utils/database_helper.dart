import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/school.dart';
import '../model/school.dart';
import '../utils/database_helper.dart';
import '../Pages/home.dart';
import '../Pages/editdetails.dart';
import '../Pages/fullldetail.dart';
import '../Pages/shortdetail.dart';

class SchoolDatabase {
  static final SchoolDatabase instance = SchoolDatabase._init();

  static Database? _database;

  SchoolDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    // final textType = 'TEXT NOT NULL';
    // final integerType = 'INTEGER NOT NULL';

    await db.execute(
      'CREATE TABLE $tableSchool ( id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,age TEXT NOT NULL,rollnum TEXT NOT NULL,mobile TEXT NOT NULL) ' );


//     await db.execute('''
// CREATE TABLE $tableSchool (
//   ${SchoolFields.id} $idType,
//   ${SchoolFields.name} $textType,
//   ${SchoolFields.age} $textType,
//   ${SchoolFields.rollnum} $textType,
//   ${SchoolFields.mobile} $textType,
//   )
// ''');
  }

  Future<School> create(School school) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableSchool, school.toJson());
    return school.copy(id: id);
  }

  Future<School> readSchool(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableSchool,
      columns: SchoolFields.values,
      where: '${SchoolFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return School.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<School>> readAllSchool() async {
    final db = await instance.database;

    final orderBy = '${SchoolFields.name} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableSchool, orderBy: orderBy);

    return result.map((json) => School.fromJson(json)).toList();
  }

  Future<int> update(School school) async {
    final db = await instance.database;

    return db.update(
      tableSchool,
      school.toJson(),
      where: '${SchoolFields.id} = ?',
      whereArgs: [school.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableSchool,
      where: '${SchoolFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
















// import 'package:sqflite/sqflite.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import '/model/school.dart';
//
// class DatabaseHelper{
//   // Creates a Singleton Object/instance
//   // This means We are Creating Instance of the database only once
//   static DatabaseHelper? _databaseHelper;
//
//   static Database? _database; // Creates a SingleTon Database
//
//   String schoolTable = 'school_table';
//   String colId = 'id';
//   String colName = 'name';
//   String colAge = 'age';
//   String colMobile = 'mobile';
//   String colRollnum = 'rollnum';
//   String colImage = 'image';
//
//
//   DatabaseHelper._createInstance();
//    // here we are creating a factory constructor which allows us to create a
//    // instance.
//   factory DatabaseHelper(){
//
//     // And we are creating this only when the Database is NULL
//
//     if(_databaseHelper == null){
//       _databaseHelper = DatabaseHelper._createInstance();
//     }
//     return _databaseHelper!;
//   }
//
//
//   // Creates a getter for database
//
//   Future<Database> get database async{
//     if(_database == null){
//       _database = await initializeDatabase();
//     }
//     return _database!;
//   }
//
//
//
//   Future<Database>initializeDatabase() async{
//     // Get the Directory path for both android and ios to store datebase.
//
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + 'school.db';
//
//
//     // Now we created a databse with school.db name and no we have to create table
//     // so, we are usinf a  method to do so.
//
//     var schoolDatabase = await openDatabase(path,version: 1,onCreate: _createDb);
//     return schoolDatabase;
//   }
//
//   void _createDb(Database db, int newVersion) async {
//     await db.execute('CREATE TABLE $schoolTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT,$colAge INTEGER,$colMobile INTEGER,$colRollnum INTEGER,$colImage TEXT)');
//   }
//
//   // Function to perform CRUD Operations
//
//   // Get All datas from The Database
//    Future<List<Map<String,dynamic>>>getSchoolMapList() async{
//     Database db = await this.database;
//     // var result = await db.rawQuery('SELECT * FROM $schoolTable order by $colName ASC');
//     var result = await db.query(schoolTable, orderBy: '$colName ASC');
//     return result;
//    }
//
//    // insert Operation object to database
//    Future<int> insertSchool(School school) async{
//     Database db = await this.database;
//     var result = await db.insert(schoolTable,school.toMap()!);
//     return result;
//    }
//     // Update Operation
//    Future<int> updateSchool(School school) async{
//     var db = await this.database;
//     var result = await db.update(schoolTable, school.toMap()!,where: '$colId = ?',whereArgs: [school.id]);
//     return result;
//    }
//
//   // Delete Operation
//   Future<int> deleteSchool(int id) async{
//     var db = await this.database;
//     int result = await db.rawDelete('DELETE FROM $schoolTable WHERE $colId = $id');
//     return result;
//   }
//
//   // Function to get Total Number of Students in Database
//
//   Future<int> getCount() async{
//     Database db = await this.database;
//     List<Map<String,dynamic>> count = await db.rawQuery('SELECT COUNT (*) from $schoolTable');
//     int result = Sqflite.firstIntValue(count)!;
//     return result;
//   }
//
//
// }