import 'package:tasks/models/category.dart';
import '../constants.dart';
import '../models/models_products.dart';
import 'package:http/http.dart' as http;

class ApiSev
{

  static Future<List<Product>> getData() async {

      print('getData');
      var url = Uri.parse(ApiConstants.baseUrl+ApiConstants.products);
      print(url.toString());
      var respone = await http.get(url);
      List<Product> model = productFromJson(respone.body);
      return model ;
  }

  static Future<List<Product>> getDataById(int id) async {
    print('getDataById');
    var url = Uri.parse(ApiConstants.baseUrl+ApiConstants.products + id.toString());
    print(url.toString());
    var respone = await http.get(url);
    List<Product> model = productFromJson(respone.body);
    return model ;
  }

  static Future<List<Category>> getDataCategories(String cate) async {

    print('getDataCategories');
    var url = Uri.parse(ApiConstants.baseUrl+ApiConstants.products + ApiConstants.categories + cate);
    print(url.toString());
    var respone = await http.get(url);
    List<Category> model = categoryFromJson(respone.body);
    return model ;
  }


  static Future<List<Product>> getDataIsFav(int id , bool isfav) async {
    print('getDataById');
    var url = Uri.parse(ApiConstants.baseUrl+ApiConstants.products + id.toString());
    print(url.toString());
    var respone = await http.get(url);
    List<Product> model = productFromJson(respone.body);
    return model ;
  }
}