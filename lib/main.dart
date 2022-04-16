import 'package:flutter/material.dart';
import 'package:designprovider/screens/home/homeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/shopping_cart_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoppingCartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) =>const HomeScreen(),
        })
    );
  }
}


