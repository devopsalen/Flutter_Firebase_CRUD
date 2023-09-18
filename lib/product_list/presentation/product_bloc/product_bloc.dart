
import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../domain/repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class FoodBloc extends Bloc<ProductEvent, ProductState> {
  FoodBloc() : super(ProductInitialState()) {
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
        emit(FoodErrorState(message: e.toString()));
      }
    });
  }
}
