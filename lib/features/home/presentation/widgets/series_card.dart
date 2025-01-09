import 'package:bd_calling_assessment/features/home/presentation/widgets/progress_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../util/dimensions.dart';


class SeriesCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String episode;
  final double height;
  final double width;
  final double progress;

  const SeriesCard({super.key, required this.title, required this.imageUrl, required this.height, required this.width, required this.progress, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
            children: [
              Container(
                height: height-30,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                  bottom: 0,
                  child: ProgressIndi(  5, width, progressWidth: progress)
              )
            ],
          ),

          SizedBox(height: 5,),

          Text(title, style: TextStyle(fontSize: Dimensions.fontSizeSmall, color: Colors.white),),

          SizedBox(height: 5,),

          Text(episode, style: TextStyle(fontSize: Dimensions.fontSizeSmall, color: Colors.white),),

        ],
      ),
    );
  }
}
