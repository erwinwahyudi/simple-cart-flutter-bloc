// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessLoadedState extends AuthState {
  final String name;
  AuthSuccessLoadedState({
    required this.name,
  });
}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState({
    required this.message,
  });
}
