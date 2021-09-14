import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maan_application_2/ui/home/models/all_products_response.dart';
import 'package:maan_application_2/themes/light_color.dart';
import 'package:maan_application_2/ui/product_details/providers/product_details_provider.dart';
import 'package:provider/provider.dart';

import '../../../../provider/db_provider.dart';

class RecentAddedWedget extends StatefulWidget {
  AllProductsResponse product;
  RecentAddedWedget(this.product);

  @override
  _RecentAddedWedgetState createState() => _RecentAddedWedgetState(product);
}

class _RecentAddedWedgetState extends State<RecentAddedWedget> {
  String icon = 'assets/images/fav.png';
  bool isLike = false;
  AllProductsResponse product;
  _RecentAddedWedgetState(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          elevation: 0,
          child: Center(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          widget.product.image,
                          width: 150,
                          height: 150,
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<DbProvider>(context, listen: false)
                                .addFav(product);
                            print(Provider.of<ProductDetailsProvider>(context,
                                    listen: false)
                                .product);
                            setState(() {
                              isLike = !isLike;
                            });
                          },
                          child: Icon(
                            isLike ? Icons.favorite : Icons.favorite_border,
                            color:
                                isLike ? LightColor.red : LightColor.lightGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 32),
                  child: Text(
                      (widget.product.title.length <= 25
                          ? widget.product.title
                          : widget.product.title.substring(0, 25)),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF444444),
                          fontFamily: 'Roboto-Light.ttf',
                          fontSize: 15,
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                      "\$  ${(widget.product.price != null) ? widget.product.price : 'Unavailable'}",
                      style: TextStyle(
                          color: (widget.product.title != null)
                              ? LightColor.red
                              : Color(0xFF0dc2cd),
                          fontFamily: 'Roboto-Light.ttf',
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                )
              ],
            ),
          )),
    );
  }
}
