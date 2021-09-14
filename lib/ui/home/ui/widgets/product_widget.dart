import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maan_application_2/ui/home/models/all_products_response.dart';

class ProductWidget extends StatelessWidget {
  AllProductsResponse product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(child: Text(product.title)),
                Spacer(),
                Text(product.price.toString())
              ],
            ),
          )
        ],
      ),
    );
  }
}
