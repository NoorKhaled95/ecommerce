import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopSellingWidget extends StatelessWidget {
  String imageUrl;
  String title;
  String icon = 'assets/images/fav.png';

  TopSellingWidget({this.imageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
                  child: Container(
                    width: 150,
                    height: 170,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 8, left: 110, top: 16),
              child: Image.asset(
                icon,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          width: 150,
          height: 50,
          child: Container(
            padding: EdgeInsets.only(top: 8),
            width: 150,
            height: 40,
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
