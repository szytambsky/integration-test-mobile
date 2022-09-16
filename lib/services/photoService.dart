import 'package:http/http.dart';
import '../models/photo.dart';

class PhotoService {
  Future<List<Photo>> getPhotos() async {
    final response = await get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?_start=0&_limit=10'));
    final photos = photoFromJson(response.body);
    return photos;
  }

  Future<List<Photo>> getPhotosWithPagination({limit: int, page: int}) async {
    final response = await get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?_limit=${limit}&_page=${page}'));
    final photos = photoFromJson(response.body);
    return photos;
  }
  // static Future<List<Photo>> getPhotosStaticFunc() async {
  //   final response = await get(Uri.parse(
  //       'https://jsonplaceholder.typicode.com/photos?_start=0&_limit=20'));
  //   final photos = photoFromJson(response.body);
  //   return photos;
  // }
}
