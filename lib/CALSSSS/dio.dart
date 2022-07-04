import 'package:dio/dio.dart';
class DioHelper{
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
            receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({required String url,required Map<String,dynamic> query}) async{
   return await dio.get(url,queryParameters: query,);
}


}

// url : https://newsapi.org/
// method : v2/top-headlines?
// qu : country=eg&category=business&apikey=b3e25db2a58f4be3ac9553c6ffdacb5a