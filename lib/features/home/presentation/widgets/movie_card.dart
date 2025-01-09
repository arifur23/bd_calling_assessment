
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../util/dimensions.dart';

class MovieCard extends StatelessWidget {
final String title;
final String imageUrl;
final double height;
final double width;

  const MovieCard({super.key, required this.title, required this.imageUrl, required this.height, required this.width});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height-30,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),


              child: CachedNetworkImage(
                placeholder: (context, url) =>
                const CircularProgressIndicator(),
                imageUrl: imageUrl,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(title, style: TextStyle(fontSize: Dimensions.fontSizeSmall , color: Colors.white),)
        ],
      ),
    );
  }
}
