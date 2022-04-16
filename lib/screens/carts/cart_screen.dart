import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:designprovider/model/dbCart.dart';
import 'package:designprovider/itemwiget/cart_item.dart';
import 'package:designprovider/bloc/shopping_cart_bloc.dart';

  class CartScreen extends StatelessWidget {
    const CartScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
      final cartBloc = BlocProvider.of<ShoppingCartBloc>(context);
  return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<ShoppingCartBloc, List<Cart>>(
        builder: (context, state) => ListView.builder(
          padding: const EdgeInsets.only(bottom: 100),
          itemCount: cartBloc.state.length,
          itemBuilder: (context, index) {
            return CartItem(cartBloc.state[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => cartBloc.add(const CheckOutEvent()),
        label: BlocBuilder<ShoppingCartBloc, List<Cart>>(
          builder: (context, state) => Text('${cartBloc.getTotalAmount()} vnd'),
        ),
        icon: const Icon(Icons.monetization_on_sharp),
      ),
    );
    }
  }
