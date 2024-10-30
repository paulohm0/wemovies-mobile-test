import 'package:flutter/material.dart';

import '../enum/app_navbar_enum.dart';
import '../models/card_movie_model.dart';

final class MainViewModel extends ChangeNotifier {
  AppNavBarEnum selectedIndex = AppNavBarEnum.home;
  List<CardMovieModel> shoppingList = [];
  bool isOrderFinalized = false;

  void orderFinalized() {
    isOrderFinalized = true;
    shoppingList = [];
    notifyListeners();
  }

  void orderReset() {
    isOrderFinalized = false;
    notifyListeners();
  }

  void onItemTapped(AppNavBarEnum index) {
    selectedIndex = index;
    notifyListeners();
  }

  Set<CardMovieModel> get getUniqueShoppingList => shoppingList.toSet();

  void addMovieToCart(CardMovieModel movie) {
    shoppingList.add(movie);
    notifyListeners();
  }

  void removeMovieToCart(CardMovieModel movie) {
    shoppingList.remove(movie);
    notifyListeners();
  }

  void removeAllMovieToCart(int id) {
    shoppingList.removeWhere((movie) => movie.idMovie == id);
    notifyListeners();
  }

  double getSumPrices() {
    double total = 0.0;
    for (CardMovieModel price in shoppingList) {
      total += price.priceMovie ?? 0.00;
    }
    return total;
  }

  int countItensShop(CardMovieModel movieModel) {
    return shoppingList.where((movie) {
      return movie.idMovie == movieModel.idMovie;
    }).length;
  }

  double sumMoviesList(CardMovieModel movieModel, int? iD) {
    return shoppingList.where((movie) {
      return movie.idMovie == iD;
    }).fold(
      0.0,
      (soma, movie) => soma + (movie.priceMovie ?? 0.0),
    );
  }
}
