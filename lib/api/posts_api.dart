import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/models/post.dart';
import 'package:news_app/utilities/api_utilities.dart';

class PostsAPI {
  Future<List<Post>> fetchTopStories() async {
    String topStoriesUrl = baseApi + topStoriesApi;
    var response = await http.get(topStoriesUrl);
    List<Post> posts = List<Post>();
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];

      for (var item in data) {
        Post post = Post(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          publishedAt: item["publishedAt"].toString(),
          urlToImage: item["urlToImage"].toString(),
        );
        posts.add(post);
      }
    }
    return posts;
  }

  Future<List<Post>> fetchWhatsNewHeader() async {
    String topStoriesUrl = baseApi + topStoriesApi;
    var response = await http.get(topStoriesUrl);
    List<Post> posts = List<Post>();
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];

      for (var item in data) {
        Post post = Post(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          publishedAt: item["publishedAt"].toString(),
          urlToImage: item["urlToImage"].toString(),
        );
        posts.add(post);
      }
    }
    return posts;
  }

  Future<List<Post>> fetchRecentUpdates() async {
    String recentUpdatesUrl = baseApi + recentUpdatesApi;
    var response = await http.get(recentUpdatesUrl);
    List<Post> posts = List<Post>();
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];

      for (var item in data) {
        Post post = Post(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          publishedAt: item["publishedAt"].toString(),
          urlToImage: item["urlToImage"].toString(),
        );
        posts.add(post);
      }
    }
    return posts;
  }

  Future<List<Post>> fetchPopular() async {
    String popularPostsUrl = baseApi + popularPostsApi;
    var response = await http.get(popularPostsUrl);
    List<Post> posts = List<Post>();
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];

      for (var item in data) {
        Post post = Post(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          publishedAt: item["publishedAt"].toString(),
          urlToImage: item["urlToImage"].toString(),
        );
        posts.add(post);
      }
    }
    return posts;
  }
}
