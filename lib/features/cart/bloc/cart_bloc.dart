import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_cart_bloc/data/cart_items.dart';
import 'package:simple_cart_bloc/features/home/models/product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitalEvent>(cartInitalEvent);
  }

  FutureOr<void> cartInitalEvent(
      CartInitalEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }
}
