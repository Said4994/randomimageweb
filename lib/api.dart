import 'package:dio/dio.dart';
import 'package:web_404/main.dart';
import 'package:web_404/model.dart';

Future<List<Resim>> getapi() async {
  try {
    Response response = await Dio().get(
        "https://api.unsplash.com/photos/random?client_id=$apikey2&count=45");

    return (response.data as List).map((x) => Resim.fromJson(x)).toList();
  } catch (e) {
    print(e);
  }
}
