import 'package:Blog_app/data/api.dart';


import '../model/comment.dart';
import '../model/post.dart';
import '../model/user.dart';

class Repository {
  late final Api _dataSource;

  Repository(this._dataSource);

  dynamic getPosts() async {
    Map<String, String> posts = await _dataSource.getPosts();
    if (posts['status'] == ApiStatus.success.name) {
      return postsFromJson(posts['data']!);
    } else {
      return posts['data'];
    }
  }

  dynamic getComments(int postId) async {
    Map<String, String> comments = await _dataSource.getComments(postId);
    if (comments['status'] == ApiStatus.success.name) {
      return commentsFromJson(comments['data']!);
    } else {
      return comments['data'];
    }
  }

  dynamic getUsers() async {
    Map<String, String> users = await _dataSource.getUsers();
    if (users['status'] == ApiStatus.success.name) {
      return userFromJson(users['data']!);
    } else {
      return users['data'];
    }
  }

}
