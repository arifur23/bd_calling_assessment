
import 'package:flutter/material.dart';

import '../../../../util/dimensions.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height *.06,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello Rafsan', style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold, color: Colors.white),),
              Text('Let\'s watch today', style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.bold, color: Colors.green),),
            ],
          ),
          Container(
            height: size.height *.06,
            width: size.height *.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white)
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/guy1.jpeg', fit: BoxFit.cover,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
