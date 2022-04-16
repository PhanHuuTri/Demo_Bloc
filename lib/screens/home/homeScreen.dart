// ignore_for_file: file_names

import 'package:designprovider/model/dbCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:designprovider/screens/home/designmodel.dart';
import 'package:designprovider/screens/carts/cart_screen.dart';
import 'package:designprovider/bloc/shopping_cart_bloc.dart';

import '../../itemwiget/badge.dart';
import '../../itemwiget/drink_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Phan Hữu Trí'),
        centerTitle: true,
        actions:  [
          _buildCartAction(context)
        ],
      ),
      body:const  DrinkList(),);
  }
  Widget _buildCartAction(BuildContext context) {
    return BlocBuilder<ShoppingCartBloc,List<Cart>>(
      builder: (ct,state){
        return Badge(
            value: state.length,
            iconButton: IconButton(
              icon: const Icon(Icons.shopping_bag_rounded),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
            ),
          );
      },
    );
  }
}
