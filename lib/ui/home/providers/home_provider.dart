import 'package:flutter/material.dart';
import 'package:maan_application_2/ui/home/data/api_helper.dart';
import 'package:maan_application_2/ui/home/models/all_products_response.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getAllProducts();
    getAllCategories();
  }
  List<AllProductsResponse> allProducts;
  List<AllProductsResponse> allProductsCategory;
  List<dynamic> allCategories;
  String selectedCategory;

  getAllProducts() async {
    allProducts = await HomeApiHelper.apiHelper.getAllProducts();
    notifyListeners();
  }

  getSelectedCategory(String category) {
    this.allProductsCategory = null;
    this.selectedCategory = category;
    notifyListeners();
    getAllProductsCategory();
  }

  getAllProductsCategory() async {
    allProductsCategory =
        await HomeApiHelper.apiHelper.getAllProductsCategory(selectedCategory);
    notifyListeners();
  }

  getAllCategories() async {
    allCategories = await HomeApiHelper.apiHelper.getAllCategories();
    notifyListeners();
  }
}
