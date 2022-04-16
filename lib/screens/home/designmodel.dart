import 'package:flutter/material.dart';
import 'package:designprovider/model/dbDrink.dart';

class HomeViewModel extends ChangeNotifier {
  List<Drink> drinks = [];

  void changeCart(List<Drink> drinks) {
    this.drinks = drinks;
    notifyListeners();
  }
  String  _id="";
  String get id => _id;
  int _dem=0;
  int get dem => _dem;

  void addItem(Drink drink) {
    this.drinks.add(drink);
    _id=drink.id;
    _dem++;
    notifyListeners();
  }

  void removeItem(Drink drink) {
    drinks.remove(drink);
    _dem--;
    notifyListeners();
  }

  bool isAdded(String drinkId){
    return drinks.any((drink) => drink.id == drinkId);
  }
  
}
