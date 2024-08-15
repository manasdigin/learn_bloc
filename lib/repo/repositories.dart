import 'package:bloc_learn_sm/model/user_model.dart';
import 'package:dio/dio.dart';

class ImageRepository {
  final String url = "https://jsonplaceholder.typicode.com/photos";

  Future<List<Albums>> getImages() async {
    try {
      final response = await Dio().get(url);
      print(response);

      if (response.data is List) {
        return (response.data as List)
            .map((json) => Albums.fromJson(json))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      // Return an empty list in case of an error
      return [];
    }
  }
}
