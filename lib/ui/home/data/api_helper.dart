import 'package:dio/dio.dart';
import 'package:maan_application_2/ui/home/models/all_products_response.dart';

class HomeApiHelper {
  HomeApiHelper._() {
    dio = Dio();
  }
  static HomeApiHelper apiHelper = HomeApiHelper._();
  Dio dio;

  Future<List<AllProductsResponse>> getAllProducts(
      [int limit = 20, sort = 'desc']) async {
    String url = 'https://fakestoreapi.com/products?limit=$limit';
    Response response = await dio.get(url);

    List responses = response.data;
    List<AllProductsResponse> allProductsResponses =
        responses.map((e) => AllProductsResponse.fromJson(e)).toList();
    return allProductsResponses;
  }

  Future<List<AllProductsResponse>> getAllProductsCategory(String cat) async {
    String url = 'https://fakestoreapi.com/products/category/$cat';
    Response responseCat = await dio.get(url);

    List responsesCat = responseCat.data;
    List<AllProductsResponse> allProductsResponsesCat =
        responsesCat.map((e) => AllProductsResponse.fromJson(e)).toList();
    return allProductsResponsesCat;
  }

  Future<List<dynamic>> getAllCategories() async {
    String url = 'https://fakestoreapi.com/products/categories';
    Response response = await dio.get(url);
    return response.data;
  }
}
