import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maan_application_2/provider/db_provider.dart';
import 'package:maan_application_2/themes/light_color.dart';
import 'package:maan_application_2/ui/home/ui/widgets/recent_added_wedget_fav.dart';
import 'package:maan_application_2/ui/product_details/ui/title_text.dart';
import 'package:provider/provider.dart';

class FavPage extends StatelessWidget {
  String defaultFontFamily = 'Roboto-Light.ttf';
  double defaultFontSize = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TitleText(
            text: "My Favourite",
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
            child: provider.allFav == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: LightColor.red,
                    ),
                  )
                : provider.allFav.length != 0
                    ? ListView.builder(
                        itemCount: provider.allFav.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: RecentAddedWedgetFav(provider.allFav[index]),
                          );
                        })
                    : Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 200,
                            color: Colors.black12,
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TitleText(
                            text: "No favourite items",
                            fontSize: 18,
                            color: Colors.black12,
                          ),
                        ],
                      )));
      }),
    );
  }
}
