// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AppDao _appDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `fName` TEXT, `lName` TEXT, `mobile` TEXT, `city` TEXT, `email` TEXT, `password` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AppDao get appDao {
    return _appDaoInstance ??= _$AppDao(database, changeListener);
  }
}

class _$AppDao extends AppDao {
  _$AppDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, dynamic>{
                  'id': item.id,
                  'fName': item.fName,
                  'lName': item.lName,
                  'mobile': item.mobile,
                  'city': item.city,
                  'email': item.email,
                  'password': item.password
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, dynamic>{
                  'id': item.id,
                  'fName': item.fName,
                  'lName': item.lName,
                  'mobile': item.mobile,
                  'city': item.city,
                  'email': item.email,
                  'password': item.password
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, dynamic>{
                  'id': item.id,
                  'fName': item.fName,
                  'lName': item.lName,
                  'mobile': item.mobile,
                  'city': item.city,
                  'email': item.email,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<User> checkUser(String mobileNumber, String password) async {
    return _queryAdapter.query(
        'SELECT * FROM User WHERE mobile = ? AND password = ?',
        arguments: <dynamic>[mobileNumber, password],
        mapper: (Map<String, dynamic> row) => User(
            row['id'] as int,
            row['fName'] as String,
            row['lName'] as String,
            row['city'] as String,
            row['email'] as String,
            row['mobile'] as String,
            row['password'] as String));
  }

  @override
  Future<User> readUserDetails(String mobile) async {
    return _queryAdapter.query('SELECT * FROM User WHERE mobile = ?',
        arguments: <dynamic>[mobile],
        mapper: (Map<String, dynamic> row) => User(
            row['id'] as int,
            row['fName'] as String,
            row['lName'] as String,
            row['city'] as String,
            row['email'] as String,
            row['mobile'] as String,
            row['password'] as String));
  }

  @override
  Future<User> readUserDetailsForDeleteRecord(String mobile) async {
    return _queryAdapter.query('SELECT * FROM User WHERE mobile = ?',
        arguments: <dynamic>[mobile],
        mapper: (Map<String, dynamic> row) => User(
            row['id'] as int,
            row['fName'] as String,
            row['lName'] as String,
            row['city'] as String,
            row['email'] as String,
            row['mobile'] as String,
            row['password'] as String));
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateUser(User user) {
    return _userUpdateAdapter.updateAndReturnChangedRows(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteUser(User user) {
    return _userDeletionAdapter.deleteAndReturnChangedRows(user);
  }
}
