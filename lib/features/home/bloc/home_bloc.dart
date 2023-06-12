import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_cart_bloc/data/cart_items.dart';
import 'package:simple_cart_bloc/data/grocery_data.dart';
import 'package:simple_cart_bloc/data/wishlist_items.dart';
import 'package:simple_cart_bloc/features/home/models/product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    //on user trigger homeBloc.add(HomeProductWishlistButtonClickEvent());
    //do something
    on<HomeProductWishlistButtonClickEvent>(
        homeProductWishlistButtonClickEvent);

    //on user trigger homeBloc.add(HomeProductCartButtonClickEvent());
    //do something
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);

    // on user trigger homeBloc.add(HomeCartButtonNavigateEvent());
    // do something
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);

    // on user trigger homeBloc.add(HomeWishlistButtonNavigateEvent());
    // do something
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    print('wishlist product clicked');
    // pass data to the BLoC event
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    print('cart product clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemAddedToCartedActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('cart navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('wishlist navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccesState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }
}
