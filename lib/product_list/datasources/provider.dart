// import 'package:food_demo_app/model/foodmodel.dart';

import '../config/serveraddress.dart';
import '../domain/entities/Restapi.dart';
import '../domain/entities/app_exceptions.dart';
import '../model/productModel.dart';

class Provider {
  /// food list
  Future<ProductModel> getProductdetails() async {
    try {
      print("Loading from api");
      var res = await RestAPI().post(ServerAddresses.productmenulist);
      print(res);
      return productModelFromJson(res);
      // return productModelFromJson(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }



}
