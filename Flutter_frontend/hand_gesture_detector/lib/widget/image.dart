import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  String ImageLink;
  CustomImage({ required this.ImageLink});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: size.width,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImageLink,
          ),
        ),
      ),
    );
  }
}
