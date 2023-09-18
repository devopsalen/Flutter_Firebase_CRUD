
import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../domain/repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        if (event is FetchProductEvent) {
          print(event);
          log(event.toString());

          var productscreen = await Repository().getProductdetails();

          emit(ProductLoadedState(productModel: productscreen));
        }
      } catch (e) {
        emit(ProductErrorState(message: e.toString()));
      }
    });
  }
}
