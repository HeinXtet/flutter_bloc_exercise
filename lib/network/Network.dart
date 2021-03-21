import 'package:dio/dio.dart';

class Network {
  final String url;

  //2
  Network(this.url);

  // 3
  Future<Response> getData(String url) async {
    print('Calling uri: $url');
    // 4
    Response response;
    Dio dio = new Dio();
    response = await dio.get(url);
    return response;
  }
}
