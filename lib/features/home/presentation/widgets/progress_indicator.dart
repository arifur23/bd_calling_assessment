import 'package:flutter/material.dart';

class ProgressIndi extends StatelessWidget {
  final double height;
  final double width;
  final double progressWidth;

  ProgressIndi(this.height, this.width, {super.key, required this.progressWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        color: Colors.transparent
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height: height,
              width: progressWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(0), bottomLeft: Radius.circular(20)),
                  color: Colors.red
              ),
            ),
          )
        ],
      ),
    );
  }
}
