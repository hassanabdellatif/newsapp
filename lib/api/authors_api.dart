import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/models/author.dart';
import 'package:news_app/utilities/api_utilities.dart';

class AuthorsAPI {
  Future<List<Author>> fetchAllAuthors() async {

    String authorsUrl = baseApi + allAuthorsApi;
    var response = await http.get(authorsUrl);
    List<Author> authors = List<Author>();

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];
      for (var item in data) {
        Author author = Author(
          item['id'].toString(),
          item['name'].toString(),
          item['url'].toString(),
          item['urlToImage'].toString(),
        );
        authors.add(author);
      }
    }
    return authors;
  }
}
