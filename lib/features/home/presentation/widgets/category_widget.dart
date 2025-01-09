
import 'package:flutter/material.dart';

import '../../../../util/app_constants.dart';
import '../../../../util/dimensions.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height *.13,
      width: size.width,
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Container(
            width: size.width - 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Categories', style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w700, color: Colors.white),),
                Text('See More', style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w400, color: Colors.white),),
              ],
            ),
          ),

          const SizedBox(height: 10,),

          Container(
            width: size.width -30,
            height: size.height*.06,
            child: ListView.builder(
              itemExtent: size.width/AppConstants.categories.length -5,
              // Color(0xff2C2C2C),
              scrollDirection: Axis.horizontal,
              itemCount: AppConstants.categories.length,
              itemBuilder: (context, indx){
                String item = AppConstants.categories[indx];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selected = indx;
                      });
                      print(selected.toString());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selected == indx ? Colors.orange : Color(0xff2C2C2C)
                      ),
                      child: Center(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Text(item, style: TextStyle(color: Colors.white54),),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
