import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Sqflite test app
class SqlDbHelper {
  static String userTable = "userTable";
  static String areaUserListTable = "areaUserListTable";
  static String areaTable = "areaTable";
  static String historyReadTable = "historyReadTable";
  static String collcetionUser = "collcetionUser";
  static String collcetion = "price";
  static String accounts = "accounts";

  //areas
  static String nameAreas = "name";
  static String areaCode = "area_code";
  static String number = "number";

  ///UserModel
  static String id = "id";
  static String accountNo = "account_id";
  static String machenNo = "machine_id";
  static String customerName = "customer_name";
  static String type = "type";
  static String area = "area";
  static String lastRead = "last_read";
  static String tarefa = "tarefa";

  static String imageRead = "image_read";
  static String read = "read";
  static String dateTime = "date_time";
  static Database? _db;

  static Future<Database?> get db async {
    if (_db == null) {
      _db = await inialDb();
      return _db;
    } else {
      return _db;
    }
  }

  static inialDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "data.db");
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreateTable,
      version: 1,
      // onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  static onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("ALTER TABLE $userTable ADD COLUMN no TEXT");
    log("onUpgrade ==================================");
  }

  static _onCreateTable(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(
        '''CREATE TABLE $userTable ("$id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "$accountNo" TEXT,"$machenNo" TEXT,"$lastRead" TEXT,"$customerName" TEXT,"$areaCode" TEXT)''');

    batch.execute(
        '''CREATE TABLE $areaTable ( "$id" INTEGER, "$nameAreas" TEXT,"$number" INTEGER)''');

    batch.execute(
        '''CREATE TABLE $historyReadTable ("$id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "$accountNo" TEXT,"$machenNo" TEXT,"$lastRead" TEXT,"$customerName" TEXT,"$areaCode" TEXT,"$imageRead" TEXT)''');

    // batch.execute(
    //     '''CREATE TABLE $areaUserListTable ("$id" INTEGER, "$nameAreas" TEXT,"$accounts" TEXT)''');

    // batch.execute(
    //     '''CREATE TABLE $readTable ("$id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "$read" TEXT, "$imageRead" TEXT, "$accountNo" TEXT)''');

    batch.execute(
        '''CREATE TABLE $collcetionUser ("$id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"$customerName"TEXT, "$collcetion" TEXT,  "$dateTime" TEXT,"$accountNo" TEXT)''');
    log("_onCreateTable ==================================");

    await batch.commit();
  }

  static readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    log("readData ==================================");
    return response;
  }

  static insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    log("insertData ==================================");

    return response;
  }

  static updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    log("updateData ==================================");

    return response;
  }

  static deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    log("deleteData ==================================");

    return response;
  }

  static deleteDataBase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "data.db");
    log("deleteDataBase ==================================");

    await deleteDatabase(path);
  }

  Future close() async => _db!.close();
}
