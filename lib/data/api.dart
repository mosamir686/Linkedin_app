import 'package:Blog_app/view/res/extension.dart';
import 'package:http/http.dart' as http;

import '../model/post.dart';

enum ApiStatus { success, fail }

class Api {
  Future<Map<String, String>> getPosts() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      return response.status();
    } catch (e) {
      return e.message();
    }
  }

  Future<Map<String, String>> getComments(int postId) async {
    try {
      var response = await http.get(Uri.parse(
          "https://jsonplaceholder.typicode.com/posts/$postId/comments"));

      return response.status();
    } catch (e) {
      return e.message();
    }
  }

  Future<Map<String, String>> getUsers() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

      return response.status();
    } catch (e) {
      return e.message();
    }
  }

  static Future postData(Post posts) async {
    var url = Uri.parse("");
    final response = await http.post(
      url,
      body: posts.toJson(),
    );
    print(response.body);
  }

}
