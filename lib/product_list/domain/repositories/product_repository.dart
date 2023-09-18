import '../../datasources/provider.dart';
import '../../model/productModel.dart';
// import '../../model/foodmodel.dart';

class Repository {
  Provider startScreenProviders = Provider();

  Future<ProductModel> getProductdetails() =>
      startScreenProviders.getProductdetails();
}
