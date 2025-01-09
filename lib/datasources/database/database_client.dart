import 'dart:convert';
import 'package:bd_calling_assessment/features/api/domain/models/recipies.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseClient {
  static final _databaseName = "myAppDatabase.db";
  static final _databaseVersion = 1;

  static final tableDishRecipes = 'dish_recipes';
  static final tableRecipes = 'recipes';

  // DishRecipes Columns
  static final columnDishRecipeId = 'id';
  static final columnTotal = 'total';
  static final columnSkip = 'skip';
  static final columnLimit = 'limit';

  // Recipes Columns
  static final columnRecipeId = 'id';
  static final columnName = 'name';
  static final columnIngredients = 'ingredients';
  static final columnInstructions = 'instructions';
  static final columnPrepTimeMinutes = 'prepTimeMinutes';
  static final columnCookTimeMinutes = 'cookTimeMinutes';
  static final columnServings = 'servings';
  static final columnDifficulty = 'difficulty';
  static final columnCuisine = 'cuisine';
  static final columnCaloriesPerServing = 'caloriesPerServing';
  static final columnTags = 'tags';
  static final columnUserId = 'userId';
  static final columnImage = 'image';
  static final columnRating = 'rating';
  static final columnReviewCount = 'reviewCount';
  static final columnMealType = 'mealType';
  static final columnDishRecipeIdu = 'dishRecipeId'; // FK to dish_recipes.id

  // Singleton pattern
  DatabaseClient._privateConstructor();
  static final DatabaseClient instance = DatabaseClient._privateConstructor();

  // The database instance
  static Database? _database;

  // Access the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  // Create the table schema
  Future _onCreate(Database db, int version) async {

    await db.execute('''
      CREATE TABLE $tableDishRecipes (
        $columnDishRecipeId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTotal INTEGER,
        $columnSkip INTEGER,
        `$columnLimit` INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableRecipes (
        $columnRecipeId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT,
        $columnIngredients TEXT,
        $columnInstructions TEXT,
        $columnPrepTimeMinutes INTEGER,
        $columnCookTimeMinutes INTEGER,
        $columnServings INTEGER,
        $columnDifficulty TEXT,
        $columnCuisine TEXT,
        $columnCaloriesPerServing INTEGER,
        $columnTags TEXT,
        $columnUserId INTEGER,
        $columnImage TEXT,
        $columnRating REAL,
        $columnReviewCount INTEGER,
        $columnMealType TEXT,
        $columnDishRecipeIdu INTEGER,
        FOREIGN KEY ($columnDishRecipeIdu) REFERENCES $tableDishRecipes ($columnDishRecipeId)
      )
    ''');

  }

  // Insert a DishRecipe
  Future<int> insertDishRecipe(DishRecipes dishRecipe) async {
    Database db = await instance.database;
    Map<String, dynamic> row = {
      columnTotal: dishRecipe.total,
      columnSkip: dishRecipe.skip,
      columnLimit: dishRecipe.limit,
    };
    return await db.insert(tableDishRecipes, row);
  }

  // Insert a Recipe
  Future<int> insertRecipe(Recipes recipe, int dishRecipeId) async {
    Database db = await instance.database;
    String encodedIngredients = json.encode(recipe.ingredients);
    String encodedInstructions = json.encode(recipe.instructions);
    String encodedTags = json.encode(recipe.tags);
    String encodedMealType = json.encode(recipe.mealType);

    Map<String, dynamic> row = {
      columnName: recipe.name,
      columnIngredients: encodedIngredients,
      columnInstructions: encodedInstructions,
      columnPrepTimeMinutes: recipe.prepTimeMinutes,
      columnCookTimeMinutes: recipe.cookTimeMinutes,
      columnServings: recipe.servings,
      columnDifficulty: recipe.difficulty,
      columnCuisine: recipe.cuisine,
      columnCaloriesPerServing: recipe.caloriesPerServing,
      columnTags: encodedTags,
      columnUserId: recipe.userId,
      columnImage: recipe.image,
      columnRating: recipe.rating,
      columnReviewCount: recipe.reviewCount,
      columnMealType: encodedMealType,
      columnDishRecipeIdu: dishRecipeId,
    };
    print("${recipe.instructions} insert");

    var d = await db.insert(tableRecipes, row);
    getRecipesForDishRecipe(0);
    return d;
  }

  // Get all DishRecipes
  Future<DishRecipes> getAllDishRecipes() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableDishRecipes);

    late DishRecipes dishRecipes;
    for (var map in maps) {

        dishRecipes = DishRecipes.fromJson(map);

    }

    return dishRecipes;
  }

  // Get all Recipes for a specific DishRecipe
  Future<List<Recipes>> getRecipesForDishRecipe(int dishRecipeId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      tableRecipes,
      where: '$columnDishRecipeId = ?',
      whereArgs: [dishRecipeId],
    );

    List<Recipes> recipes = [];
    for (var map in maps) {

      print(map.toString());
      recipes.add(Recipes.fromJson(map));

    }

    return recipes;
  }


  Future<int> deleteRecipes() async {
    Database db = await instance.database;
    return await db.rawDelete("DELETE FROM $tableRecipes");
  }

  Future<int> deleteDish()async{
    Database db = await instance.database;
    return await db.rawDelete("DELETE FROM $tableDishRecipes");
  }

  // Decode a JSON string into a list
  List<String> decodeList(String listString) {
    return List<String>.from(json.decode(listString));
  }

  // Encode a list into a JSON string
  String encodeList(List<String> list) {
    return json.encode(list);
  }
}
