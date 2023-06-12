import 'package:flutter/material.dart';
import 'package:simple_cart_bloc/features/cart/ui/cart.dart';
import 'package:simple_cart_bloc/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cart_bloc/features/home/ui/product_tile_widget.dart';
import 'package:simple_cart_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // load products data on HomeInitialEvent
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlist()));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Product added to wishlist"),
          ));
        } else if (state is HomeProductItemAddedToCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Product added to cart"),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccesState:
            final successState = state as HomeLoadedSuccesState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Simple Cart Flutter Bloc"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_cart_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      productDataModel: successState.products[index],
                      homeBloc: homeBloc,
                    );
                  }),
            );
          case HomeErrorState:
            return const Scaffold(
                body: Center(
              child: Text("Something went wrong"),
            ));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
