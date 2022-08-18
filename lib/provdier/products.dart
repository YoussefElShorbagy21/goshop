
import 'package:flutter/material.dart';
import 'package:tasks/models/models_products.dart';
import 'package:tasks/sevice/apiservice.dart';

import '../models/category.dart';

class ProviderData extends ChangeNotifier {

  List<Product> p = [];
  List<Product>  pId = [] ;
  List<Category> categories = [] ;

  getProducts(context)  async {
        print('getList');
        p = (await ApiSev.getData())  ;
        print('p.toStr');
        notifyListeners();
        print('notifyListeners');
  }

  getProductById(context , id) async {
    pId = await ApiSev.getDataById(id) ;
    print(id);
    print('getPostsById in ProviderData');
    notifyListeners();
  }

  getCategories(context, String c) async {
    categories = await ApiSev.getDataCategories(c);
    notifyListeners();
  }

}

