import 'package:designprovider/bloc/shopping_cart_bloc.dart';
import 'package:designprovider/model/dbCart.dart';
import 'package:flutter/material.dart';
import 'package:designprovider/model/dbDrink.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkItem extends StatelessWidget {
  final Drink drink;
  const DrinkItem(this.drink,{Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final carlBloc = BlocProvider.of<ShoppingCartBloc>(context,listen: false);
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: Image.network(
            drink.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: _buildFooter(drink, context,carlBloc),
        ),
      ),
    );
  }

  Widget _buildFooter(Drink drink2, BuildContext context,ShoppingCartBloc cartBloc) {
    return GridTileBar(
      backgroundColor: Colors.black38,
      title: Text(drink2.title),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(
          '${drink2.price} vnd',
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
      ),
      trailing: _getAddingStateIcon(drink2,cartBloc),
    );
  }

  Widget _getAddingStateIcon(Drink drink1,ShoppingCartBloc cartBloc) {
    return BlocBuilder<ShoppingCartBloc,List<Cart>>(
      builder: (context,state){
        return cartBloc.isAdded(drink1.id)?
        IconButton(
        onPressed: () {
         cartBloc.add(RemoveFromCartEvent(drink1.id));
        },
        icon: const Icon(Icons.check_rounded),
      ):IconButton(
      onPressed: () {
       cartBloc.add(AddToCartEvent(drink1.id));
      },
      icon: const Icon(Icons.add_rounded),
    );
      },
    );}
}
