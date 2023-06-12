// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:simple_cart_bloc/features/home/bloc/home_bloc.dart';
import 'package:simple_cart_bloc/features/home/models/product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({
    Key? key,
    required this.productDataModel,
    required this.homeBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(productDataModel.imageUrl),
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${productDataModel.price.toString()}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickEvent(
                            clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickEvent(
                            clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
