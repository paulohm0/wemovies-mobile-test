import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../enum/app_navbar_enum.dart';
import '../models/card_movie_model.dart';

final class MainViewModel extends ChangeNotifier {
  AppNavBarEnum selectedIndex = AppNavBarEnum.home;
  List<CardMovieModel> shoppingList = [];

  void getGroupedById() {
    groupBy(shoppingList, (CardMovieModel item) => item.idMovie);
  }

  void onItemTapped(AppNavBarEnum index) {
    selectedIndex = index;
    notifyListeners();
  }

  void addMovieToCart(CardMovieModel movie) {
    shoppingList.add(movie);
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
}
