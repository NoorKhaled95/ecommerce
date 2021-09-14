import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maan_application_2/provider/db_provider.dart';
import 'package:maan_application_2/themes/light_color.dart';
import 'package:maan_application_2/ui/home/models/all_products_response.dart';
import 'package:provider/provider.dart';

class RecentAddedWedgetFav extends StatelessWidget {
  AllProductsResponse product;
  RecentAddedWedgetFav(this.product);
  String icon = 'assets/images/fav.png';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 8, right: 8, top: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        product.title.substring(0, 15),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Text(
                      product.description.substring(0, 80),
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.4)),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Provider.of<DbProvider>(context, listen: false)
                          .deleteFavProduct(product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.delete,
                        color: LightColor.red,
                        size: 15,
                      ),
                    ),
                  ),
                  Text(
                    product.price.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
