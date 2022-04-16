import 'package:designprovider/bloc/shopping_cart_bloc.dart';
import 'package:designprovider/model/dbCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final Cart cart;
  const CartItem( this.cart,{Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<ShoppingCartBloc>(context,listen: false);
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(top: 6, left: 6, right: 6),
      child: ListTile(
        leading: Image.network(
          cart.drink.imageUrl,
        ),
        title: Text(cart.drink.title),
        subtitle: Text('${cart.drink.price * cart.quantity} vnd'),
        trailing:Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                   BlocProvider.of<ShoppingCartBloc>(context,listen: false).add(RemoveFromCartEvent(cart.drink.id));
                },
                icon: const Icon(Icons.remove_rounded),
              ),
            Text('${cart.quantity}'),
            IconButton(
                onPressed: (){
                    BlocProvider.of<ShoppingCartBloc>(context,listen: false).add(AddToCartEvent(cart.drink.id));
                },
                icon: const Icon(Icons.add_rounded),
              )
          ],
        ) 
        ),
    );
  }
}
