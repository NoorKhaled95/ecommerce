import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maan_application_2/themes/light_color.dart';
import 'package:maan_application_2/ui/home/models/all_products_response.dart';
import 'package:maan_application_2/ui/home/providers/home_provider.dart';
import 'package:maan_application_2/ui/home/ui/widgets/category_widget.dart';
import 'package:maan_application_2/ui/home/ui/widgets/recent_added_wedget.dart';
import 'package:maan_application_2/ui/product_details/providers/product_details_provider.dart';
import 'package:maan_application_2/ui/product_details/ui/product_detail.dart';
import 'package:maan_application_2/ui/product_details/ui/title_text.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'widgets/carousel_with_indicator.dart';

class ShoppingPage extends StatelessWidget {
  List images = [
    'assets/images/electronics.jpg',
    'assets/images/jewelery.jpg',
    'assets/images/mclothing.jpg',
    'assets/images/wclothing.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TitleText(
            text: "E Shopping",
            fontSize: 18,
            color: LightColor.red,
          ),
        ),
        backgroundColor: LightColor.background,
        actions: [
          IconButton(
              onPressed: () {
                Locale currentLocale = context.locale;
                if (currentLocale == Locale('en')) {
                  context.setLocale(Locale('ar'));
                } else {
                  context.setLocale(Locale('en'));
                }
              },
              icon: Icon(
                Icons.language,
                color: Colors.grey[400],
              )),
        ],
      ),
      body: Consumer<HomeProvider>(builder: (context, provider, x) {
        List<AllProductsResponse> products = provider.allProducts;
        List<AllProductsResponse> randomProducts = List();
        List<AllProductsResponse> productsCategory =
            provider.allProductsCategory;
        if (products != null) {
          for (var i = 0; i < 5; i++) {
            randomProducts
                .add(products[new Random().nextInt((products.length).round())]);
          }
        }
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: randomProducts != null && randomProducts.length != 0
                      ? CarouselWithIndicator(
                          products: randomProducts,
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: LightColor.red,
                          ),
                        ),
                ),
                SizedBox(
                  height: 50,
                  child: Container(
                    padding: EdgeInsets.only(right: 16, left: 16, top: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Categories'.tr(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                provider.allCategories == null
                    ? SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: LightColor.red,
                          ),
                        ))
                    : SizedBox(
                        height: 100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: provider.allCategories.map((e) {
                              return GestureDetector(
                                onTap: () {
                                  Provider.of<HomeProvider>(context,
                                          listen: false)
                                      .getSelectedCategory(e);
                                },
                                child: CategoryWidget(
                                  imageUrl:
                                      images[provider.allCategories.indexOf(e)],
                                  title: e,
                                ),
                              );
                            }).toList(),
                          ),
                        )),
                SizedBox(
                  height: 50,
                  child: Container(
                    padding: EdgeInsets.only(right: 16, left: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Products'.tr(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        GestureDetector(
                          onTap: () {
                            provider.allProductsCategory = null;
                          },
                          child: Text('See all'.tr(),
                              style: TextStyle(
                                fontSize: 12,
                                color: LightColor.red,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 286,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productsCategory != null &&
                              productsCategory.length != null
                          ? productsCategory.length
                          : products != null && products.length != null
                              ? products.length
                              : 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Provider.of<ProductDetailsProvider>(context,
                                    listen: false)
                                .getProductResponse(products[index].id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailPage()));
                          },
                          child: RecentAddedWedget(productsCategory != null
                              ? productsCategory[index]
                              : products[index]),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
        // }
      }),
    );
  }
}
