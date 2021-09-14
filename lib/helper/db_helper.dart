import 'package:maan_application_2/ui/home/models/all_products_response.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();

  static const String cartTableName = 'cart';
  static const String favTableName = 'fav';
  static const String idColumn = 'id';
  static const String imageColumn = 'image';
  static const String titleColumn = 'title';
  static const String priceColumn = 'price';
  static const String categoryColumn = 'category';
  static const String descriptionColumn = 'description';

  static Database _database;

  Future<Database> get database async {
    _database = await initDB();
    return _database;
  }

  static const tableCart =
      '''CREATE TABLE $cartTableName ($idColumn INTEGER PRIMARY KEY ,$titleColumn TEXT,$priceColumn INTEGER,$descriptionColumn TEXT, $categoryColumn Text, $imageColumn TEXT)''';

  static const tableFav =
      '''CREATE TABLE $favTableName ($idColumn INTEGER PRIMARY KEY ,$titleColumn TEXT,$priceColumn INTEGER,$descriptionColumn TEXT, $categoryColumn Text, $imageColumn TEXT)''';

  Future<Database> initDB() async {
    print("initDB executed");
    String pathDb = await getDatabasesPath();
    String path = pathDb + "shopping.db";
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(tableFav);
        await db.execute(tableCart);
      },
      onOpen: (db) {},
    );
    return database;
  }

  insertNewProductFav(AllProductsResponse product) async {
    final db = await database;
    int rowIndex = await db.insert(favTableName, product.toMap());
  }

  Future<List<AllProductsResponse>> getAllFavProducts() async {
    final db = await database;
    List results = await db.query(favTableName);
    List<AllProductsResponse> products =
        results.map((e) => AllProductsResponse.fromMap(e)).toList();
    return products;
  }

  deleteFavProduct(int id) async {
    final db = await database;
    db.delete(favTableName, where: '$idColumn=?', whereArgs: [id]);
  }

  insertNewProductCat(AllProductsResponse product) async {
    final db = await database;
    int rowIndex = await db.insert(cartTableName, product.toMap());
  }

  Future<List<AllProductsResponse>> getAllCatProducts() async {
    final db = await database;
    List results = await db.query(cartTableName);
    List<AllProductsResponse> products =
        results.map((e) => AllProductsResponse.fromMap(e)).toList();
    return products;
  }

  deleteCatProduct(int id) async {
    final db = await database;
    db.delete(cartTableName, where: '$idColumn=?', whereArgs: [id]);
  }
}
