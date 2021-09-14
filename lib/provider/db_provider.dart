import 'package:flutter/cupertino.dart';
import 'package:maan_application_2/ui/home/models/all_products_response.dart';

import '../helper/db_helper.dart';
import '../helper/custom_dialogue.dart';

class DbProvider extends ChangeNotifier {
  List<AllProductsResponse> allFav;
  List<AllProductsResponse> allCart;

  DbProvider() {
    DBHelper.dbHelper.database;
    setAllLists();
  }

  setAllLists() async {
    allFav = await DBHelper.dbHelper.getAllFavProducts();
    allCart = await DBHelper.dbHelper.getAllCatProducts();
    notifyListeners();
  }

  deleteFavProduct(AllProductsResponse product) async {
    CustomDialoug.customDialoug.showCustomDialoug(
        'You will delete this product from favourite, are you sure',
        'Alert',
        excuteFavDeltet,
        product.id);
  }

  deleteCatProduct(AllProductsResponse product) async {
    CustomDialoug.customDialoug.showCustomDialoug(
        'You will delete this product from cart, are you sure',
        'Alert',
        excuteDeltet,
        product.id);
  }

  addFav(AllProductsResponse product) async {
    await DBHelper.dbHelper.insertNewProductFav(product);
    print(product);
    setAllLists();
  }

  addCart(AllProductsResponse product) async {
    await DBHelper.dbHelper.insertNewProductCat(product);
    setAllLists();
  }

  excuteDeltet(int id) async {
    await DBHelper.dbHelper.deleteCatProduct(id);
    setAllLists();
  }

  excuteFavDeltet(int id) async {
    await DBHelper.dbHelper.deleteFavProduct(id);
    setAllLists();
  }
}
