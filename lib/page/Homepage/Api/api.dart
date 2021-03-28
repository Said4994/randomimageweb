import 'package:dio/dio.dart';
import 'package:web_404/page/Homepage/model/model.dart';

final String genericapikey = "ojy9rVHXrIkZGxOSVOlIAF-D4iu4jwPlNJ9TccEFnpM";
final apikey1 = "ojy9rVHXrIkZGxOSVOlIAF-D4iu4jwPlNJ9TccEFnpM";
final apikey2 = 'oRC95d5jq5hqf9bsJ3vrl7SKmiagEBcbEwzDDhF9qBQ';
final apikey3 = 'JnUAcB_5dwbuYD4HHsrHOqy_xbxhm8Z7NNaXfze3KeM';

Future<List<Resim>> getapi(String value) async {
  try {
    Response response = await Dio().get(
        "https://api.unsplash.com/photos/random/?client_id=$apikey1&count=20&query=$value");

    return (response.data as List).map((x) => Resim.fromJson(x)).toList();
  } catch (e) {
    print(e);
  }
}
