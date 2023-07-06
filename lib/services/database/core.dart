import 'package:sadra_store/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/token.dart';

const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
const primaryKey = 'INTEGER PRIMARY KEY';
// const boolType = 'BOOLEAN NOT NULL';
const integerType = 'INTEGER';
const textType = 'TEXT';

class CoreDatabase {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'sadra.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE $tokenTableName (${TokenFields.id} $idType, ${TokenFields.token} $textType)");
        await db.execute(
            "CREATE TABLE $userTableName (${UserFields.personId} $primaryKey , ${UserFields.personClientId} $integerType , ${UserFields.personCode} $integerType,${UserFields.personGroupId} , ${UserFields.personType} $integerType , ${UserFields.prifix} $textType , ${UserFields.firstName} $textType , ${UserFields.lastName} $textType , ${UserFields.organization} $textType, ${UserFields.gender} $integerType , ${UserFields.email} $textType , ${UserFields.userName} $textType ,${UserFields.password} $textType , ${UserFields.address} $textType , ${UserFields.phone} $textType  , ${UserFields.mobile} $textType , ${UserFields.deleted} $integerType , ${UserFields.dataHash} $textType , ${UserFields.rowVersion} $integerType , ${UserFields.personGroupClientId} $integerType , ${UserFields.personGroupCode}  $integerType  )");
      },
      onUpgrade: (db, oldVersion, newVersion) async {},
    );
  }
}
