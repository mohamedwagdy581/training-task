import 'package:dio/dio.dart';

import 'product_model.dart';

class ProductRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com/'));

  Future<List<ProductModel>> getAllProducts() async {
    final response = await dio.get('products');
    return (response.data['products'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<String>> getCategories() async {
    final response = await dio.get('products/categories');
    return (response.data as List).map((e) => e.toString()).toList();
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await dio.get('products/category/$category');
    return (response.data['products'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
