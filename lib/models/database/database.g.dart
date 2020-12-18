// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

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

  PersonDao _personDaoInstance;

  NewsDao _newsDaoInstance;

  SettingsDao _settingsDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
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
            'CREATE TABLE IF NOT EXISTS `Person` (`id` TEXT, `email` TEXT, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `News` (`title` TEXT, `author` TEXT, `description` TEXT, `urlToImage` TEXT, `publishedAt` TEXT, `content` TEXT, `articleUrl` TEXT, PRIMARY KEY (`title`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Settings` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `country` TEXT, `lang` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }

  @override
  NewsDao get newsDao {
    return _newsDaoInstance ??= _$NewsDao(database, changeListener);
  }

  @override
  SettingsDao get settingsDao {
    return _settingsDaoInstance ??= _$SettingsDao(database, changeListener);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'Person',
            (Person item) => <String, dynamic>{
                  'id': item.id,
                  'email': item.email,
                  'name': item.name
                },
            changeListener),
        _personDeletionAdapter = DeletionAdapter(
            database,
            'Person',
            ['id'],
            (Person item) => <String, dynamic>{
                  'id': item.id,
                  'email': item.email,
                  'name': item.name
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Person> _personInsertionAdapter;

  final DeletionAdapter<Person> _personDeletionAdapter;

  @override
  Future<List<Person>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, dynamic> row) => Person(row['id'] as String,
            row['name'] as String, row['email'] as String));
  }

  @override
  Stream<Person> findPersonById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Person WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'Person',
        isView: false,
        mapper: (Map<String, dynamic> row) => Person(row['id'] as String,
            row['name'] as String, row['email'] as String));
  }

  @override
  Future<void> insertPerson(Person person) async {
    await _personInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTask(Person news) async {
    await _personDeletionAdapter.delete(news);
  }
}

class _$NewsDao extends NewsDao {
  _$NewsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _newsInsertionAdapter = InsertionAdapter(
            database,
            'News',
            (News item) => <String, dynamic>{
                  'title': item.title,
                  'author': item.author,
                  'description': item.description,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content,
                  'articleUrl': item.articleUrl
                },
            changeListener),
        _newsDeletionAdapter = DeletionAdapter(
            database,
            'News',
            ['title'],
            (News item) => <String, dynamic>{
                  'title': item.title,
                  'author': item.author,
                  'description': item.description,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content,
                  'articleUrl': item.articleUrl
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<News> _newsInsertionAdapter;

  final DeletionAdapter<News> _newsDeletionAdapter;

  @override
  Future<List<News>> findAllNews() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, dynamic> row) => News(
            row['title'] as String,
            row['author'] as String,
            row['description'] as String,
            row['urlToImage'] as String,
            row['publishedAt'] as String,
            row['content'] as String,
            row['articleUrl'] as String));
  }

  @override
  Stream<News> findNewsById(String title) {
    return _queryAdapter.queryStream('SELECT * FROM Person WHERE id = ?',
        arguments: <dynamic>[title],
        queryableName: 'News',
        isView: false,
        mapper: (Map<String, dynamic> row) => News(
            row['title'] as String,
            row['author'] as String,
            row['description'] as String,
            row['urlToImage'] as String,
            row['publishedAt'] as String,
            row['content'] as String,
            row['articleUrl'] as String));
  }

  @override
  Future<void> insertNews(News news) async {
    await _newsInsertionAdapter.insert(news, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTask(News news) async {
    await _newsDeletionAdapter.delete(news);
  }
}

class _$SettingsDao extends SettingsDao {
  _$SettingsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _settingsInsertionAdapter = InsertionAdapter(
            database,
            'Settings',
            (Settings item) => <String, dynamic>{
                  'id': item.id,
                  'country': item.country,
                  'lang': item.lang
                }),
        _settingsUpdateAdapter = UpdateAdapter(
            database,
            'Settings',
            ['id'],
            (Settings item) => <String, dynamic>{
                  'id': item.id,
                  'country': item.country,
                  'lang': item.lang
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Settings> _settingsInsertionAdapter;

  final UpdateAdapter<Settings> _settingsUpdateAdapter;

  @override
  Future<List<Settings>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, dynamic> row) => Settings(
            row['id'] as int, row['country'] as String, row['lang'] as String));
  }

  @override
  Future<void> insertPerson(Settings settings) async {
    await _settingsInsertionAdapter.insert(settings, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSettings(Settings settings) async {
    await _settingsUpdateAdapter.update(settings, OnConflictStrategy.abort);
  }
}
