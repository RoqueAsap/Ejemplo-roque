import 'package:ejemplo_lunes/app/config/error/exceptions.dart';
import 'package:ejemplo_lunes/app/modules/home/models/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  SharedPreferences sharedPreferences;
  LocalService({
    required this.sharedPreferences,
  });
  void savePost(ResponseModel post) {
    try {
      sharedPreferences.setString('post', post.body);
    } catch (e) {
      throw LocalStorageException();
    }
  }

  ResponseModel getPost() {
    final body = sharedPreferences.getString('post');
    if (body != null) {
      return ResponseModel(userId: 1, id: 1, title: 'title', body: body);
    }
    throw LocalStorageException();
  }
}
