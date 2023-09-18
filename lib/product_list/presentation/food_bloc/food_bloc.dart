
import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../domain/repositories/product_repository.dart';
import 'food_event.dart';
import 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitialState()) {
    on<FoodEvent>((event, emit) async {
      emit(FoodLoadingState());
      try {
        if (event is FetchFoodEvent) {
          print(event);
          log(event.toString());

          var foodscreen = await Repository().getFooddetails();

          emit(FoodLoadedState(foodModel: foodscreen));
        }
      } catch (e) {
        emit(FoodErrorState(message: e.toString()));
      }
    });
  }
}
