import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(AuthSuccessLoadedState(name: 'Erwin Wahyudi'));
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthInitial());
    });
  }
}
