import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cart_bloc/features/auth/bloc/auth_bloc.dart';
import 'package:simple_cart_bloc/features/auth/ui/login_page.dart';
import 'package:simple_cart_bloc/features/home/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        // title: 'Simple Cart Flutter Bloc',
        theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            }

            if (state is AuthSuccessLoadedState) {
              return const HomePage();
            }
            return const LoginPage();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
