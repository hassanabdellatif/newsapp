import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:news_app/models/category.dart';

class CategoriesAPI {
  Future<List<Category>> fetchAllCategories() async {

    String categoriesUrl = baseApi + allCategoriesApi;
    var response = await http.get(categoriesUrl);
    List<Category> categories = List<Category>();

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["sources"];
      for (var item in data) {
        Category category = Category(
          item["id"].toString(),
          item["category"].toString(),
        );
        categories.add(category);
      }
    }
    return categories;
  }
}
