import 'package:flutter/material.dart';
import 'package:designprovider/model/dataModel/data.dart';
import 'drinkitem.dart';

class DrinkList extends StatelessWidget {
  const DrinkList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drinks = FakeDataRepository.someFakeDrinksData;
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: drinks.length,
          itemBuilder: (context, index) => DrinkItem(drinks[index],
          ),
        );
        // ignore: avoid_print
        }
        }