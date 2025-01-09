import 'package:bd_calling_assessment/features/api/domain/services/api_service_interface.dart';
import 'package:get/get.dart';

import '../../../datasources/database/database_client.dart';
import '../domain/models/recipies.dart';

class ApiController extends GetxController implements GetxService{
  final ApiServiceInterface apiServiceInterface;


  @override
  void onInit() {
     // getApiData();
    super.onInit();
  }

  DishRecipes? dishRecipes;

  DatabaseClient dbClient = DatabaseClient.instance;

  ApiController({required this.apiServiceInterface});

  bool isLoading = false;

  Future<void> getApiData() async{
    isLoading = true;
    print('calling Api Controller');
    dbClient = await DatabaseClient.instance;
    Response response = await apiServiceInterface.getRecipeData();

    if(response.statusCode == 200){
      dishRecipes = DishRecipes.fromJson(response.body);
      //print(dishRecipes!.recipes!.first.instructions.toString());
      isLoading = false;

      try{
        // await dbClient.deleteDish();
        var d = await dbClient.insertDishRecipe(dishRecipes!).toString();

        for(var recip in dishRecipes!.recipes!){
          var dd = await dbClient.insertRecipe(recip, 1);

        }

        print(d.toString());

      }catch(e){

      }

      update();
    }else{
      isLoading = true;
      try{
        List<Recipes> recipes = await dbClient.getRecipesForDishRecipe(1);

        dishRecipes!.recipes = recipes;
        print(dishRecipes!.limit.toString());
        print(dishRecipes!.recipes!.length.toString());
      }catch(e){

      }
      isLoading = false;
      update();
    }
  }

}