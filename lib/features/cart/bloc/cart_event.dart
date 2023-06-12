part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitalEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {}
