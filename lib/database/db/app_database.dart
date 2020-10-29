import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_widget/database/dao/app_dao.dart';
import 'package:flutter_widget/database/model/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

// Auto Generate Code
part 'app_database.g.dart';

// convert simple class into database
@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  // Create get object of AppDao Class
  AppDao get appDao;
}
