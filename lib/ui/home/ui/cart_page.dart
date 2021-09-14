import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maan_application_2/themes/light_color.dart';
import 'package:maan_application_2/ui/home/ui/widgets/recent_added_wedget_cart.dart';
import 'package:maan_application_2/ui/product_details/ui/title_text.dart';
import 'package:provider/provider.dart';

import '../../../provider/db_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TitleText(
            text: "My cart",
            fontSize: 18,
            color: LightColor.red,
          ),
        ),
        backgroundColor: LightColor.background,
      ),
      body: Consumer<DbProvider>(builder: (context, provider, x) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: provider.allCart == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: LightColor.red,
                  ),
                )
              : provider.allCart.length != 0
                  ? ListView.builder(
                      itemCount: provider.allCart.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: RecentAddedWedgetCart(provider.allCart[index]),
                        );
                      })
                  : Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 200,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        TitleText(
                          text: "No cart items",
                          fontSize: 18,
                          color: Colors.black12,
                        ),
                      ],
                    )),
        );
      }),
    );
  }
}
