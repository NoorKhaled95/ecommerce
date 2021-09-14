import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderImageWidget extends StatelessWidget {
  String imageUrl;
  String title;
  String desc;

  SliderImageWidget({this.imageUrl, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.overlay),
              child: Container(
                width: 340,
                height: 300,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
