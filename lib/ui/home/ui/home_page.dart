import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maan_application_2/BottomNavigationBar/bootom_navigation_bar.dart';
import 'package:maan_application_2/themes/light_color.dart';
import 'package:maan_application_2/ui/home/ui/cart_page.dart';
import 'package:maan_application_2/ui/home/ui/fav_page.dart';
import 'package:maan_application_2/ui/home/ui/profile_page.dart';
import 'package:maan_application_2/ui/home/ui/shopping_page.dart';
import 'package:maan_application_2/ui/product_details/providers/product_details_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    'assets/images/electronics.jpg',
    'assets/images/jewelery.jpg',
    'assets/images/mclothing.jpg',
    'assets/images/wclothing.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.light,
      body: PageView(
        controller: Provider.of<ProductDetailsProvider>(context, listen: false)
            .pageController,
        children: [ShoppingPage(), FavPage(), CartPage(), ProfilePage()],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onIconPresedCallback: onBottomIconPressed,
      ),
    );
  }

  bool isHomePageSelected = true;

  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
        Provider.of<ProductDetailsProvider>(context, listen: false)
            .changePageIndex(index);
      });
    } else {
      setState(() {
        isHomePageSelected = false;
        Provider.of<ProductDetailsProvider>(context, listen: false)
            .changePageIndex(index);
      });
    }
  }
}
