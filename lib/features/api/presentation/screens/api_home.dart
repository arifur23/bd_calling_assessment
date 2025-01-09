import 'package:bd_calling_assessment/features/api/controllers/api_controller.dart';
import 'package:bd_calling_assessment/features/api/presentation/widgets/api_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/recipies.dart';

class ApiHome extends StatefulWidget {
  const ApiHome({super.key});

  @override
  State<ApiHome> createState() => _ApiHomeState();
}

class _ApiHomeState extends State<ApiHome> {

  @override
  void initState() {
    Get.find<ApiController>().getApiData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(apiController.dishRecipes!.recipes.toString());


    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ApiController>(builder: (apiController){
        return apiController.isLoading ?  Center(child: CircularProgressIndicator()) : Center(
          child: Container(
            height: size.height,
            width: size.width,
            child: apiController.dishRecipes == null ?
             Container(
               height: 50,
                 width: 50,
                 child: Center(child: CircularProgressIndicator())) :

            ListView.builder(
              itemCount: apiController.dishRecipes!.recipes!.length,
              itemBuilder: (BuildContext context, int index) {
                print('calling Api UI');
                Recipes recipes = apiController.dishRecipes!.recipes![index];
                return ApiCard(recipes: recipes,);
              },
            ),

          ),
        );
      }),

    );
  }
}
