import '../../datasources/provider.dart';
// import '../../model/foodmodel.dart';

class Repository {
  Provider startScreenProviders = Provider();

  Future <List<ProductModel>> getProductdetails() =>
      startScreenProviders.getProductdetails();
}
