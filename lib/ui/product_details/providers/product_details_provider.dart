import 'package:flutter/material.dart';
import 'package:maan_application_2/ui/home/models/all_products_response.dart';
import 'package:maan_application_2/ui/product_details/data/api_helper.dart';

class ProductDetailsProvider extends ChangeNotifier {
  AllProductsResponse product;
  getProductResponse(int id) async {
    product = null;
    product = await ProductDetailsApiHelper.apiHelper.getProductDetails(id);
    notifyListeners();
  }

  PageController pageController = PageController();
  int currentPageIndex = 0;
  changePageIndex(int newIndex) {
    pageController.jumpToPage(newIndex);
    this.currentPageIndex = newIndex;
    notifyListeners();
  }
}
