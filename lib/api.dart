import 'package:dio/dio.dart';
import 'package:web_404/main.dart';
import 'package:web_404/model.dart';

Future<List<Resim>> getapi(String value) async {
  try {
    Response response = await Dio().get(
        "https://api.unsplash.com/photos/random/?client_id=$apikey2&count=20&query=$value");

    return (response.data as List).map((x) => Resim.fromJson(x)).toList();
  } catch (e) {
    print(e);
  }
}
