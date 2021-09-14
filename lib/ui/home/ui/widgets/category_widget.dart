import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  String imageUrl;
  String title;

  CategoryWidget({this.imageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              child: Container(
                width: 150,
                height: 100,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          width: 150,
          height: 100,
          child: Center(
            child: Text(
              title.toString()[0].toUpperCase() + title.toString().substring(1),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        )
      ],
    ));
  }
}
