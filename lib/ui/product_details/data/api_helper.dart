import 'package:dio/dio.dart';
import 'package:maan_application_2/ui/home/models/all_products_response.dart';

class ProductDetailsApiHelper {
  ProductDetailsApiHelper._() {
    dio = Dio();
  }
  static ProductDetailsApiHelper apiHelper = ProductDetailsApiHelper._();
  Dio dio;
  Future<AllProductsResponse> getProductDetails(int id) async {
    String url = 'https://fakestoreapi.com/products/$id';
    Response response = await dio.get(url);
    AllProductsResponse allProductsResponse =
        AllProductsResponse.fromJson(response.data);
    return allProductsResponse;
  }
}
