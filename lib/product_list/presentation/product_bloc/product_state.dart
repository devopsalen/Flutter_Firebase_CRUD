
import 'package:equatable/equatable.dart';
import 'package:firebase_crud/product_list/model/productModel.dart';


class ProductState extends Equatable { //main state
  @override
  List<Object> get props => [];
}

class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends ProductState {
  final ProductModel productModel;

  ProductLoadedState({required this.productModel});

  @override
  List<Object> get props => [];
}

class ProductErrorState extends ProductState {
 final String message;

  ProductErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
