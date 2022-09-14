import 'package:dio/dio.dart';

class DioHelper
{

  static Future getCategories() async
  {
    Dio dio = Dio();
    
    var response = await dio.get('http://www.themealdb.com/api/json/v1/1/categories.php');

    print('response :: ');
    print('response :: ${response.data}');


    return response;
  }
}