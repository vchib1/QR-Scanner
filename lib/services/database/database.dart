import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

const history = "history";

const _uuid = Uuid();

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();

  static Database? _database;

  LocalDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("app-database");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';

    await db.execute('''CREATE TABLE $history(
        id TEXT PRIMARY KEY,
        data $textType,
        createdAt $intType
    )''');
  }

  static Future<void> insertScannedItem(ScannedItem item) async {
    final db = await instance.database;

    await db.insert(history, item.copyWith(id: _uuid.v4()).toMap());
  }
}
