import 'package:bd_calling_assessment/util/dimensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/models/recipies.dart';

class ApiCard extends StatelessWidget {

  final Recipes recipes;

  const ApiCard({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width * .8,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),

      child: Column(
        children: [
          Text(recipes.name!, style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold,color: Colors.black),),
          const SizedBox(height: 7,),
          Text(recipes.cuisine!, style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.bold,color: Colors.black),),
          const SizedBox(height: 7,),
          Text(recipes.instructions!.first, style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.bold,color: Colors.black),),
          const SizedBox(height: 7,),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * .5,
            child: CachedNetworkImage(
              placeholder: (context, url) =>
              const CircularProgressIndicator(),
              imageUrl: recipes.image!,
            ),
          )
        ],
      ),
    );
  }
}
