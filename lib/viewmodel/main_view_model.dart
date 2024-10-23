import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../enum/app_navbar_enum.dart';
import '../models/card_movie_model.dart';

final class MainViewModel extends ChangeNotifier {
  AppNavBarEnum selectedIndex = AppNavBarEnum.home;
  List<CardMovieModel> shoppingList = [];
  int contador = 0;

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

  void getMovie(CardMovieModel movie) {
    for (var shoooppingList in shoppingList) {
      if (shoooppingList.idMovie == movie.idMovie) {
        contador++;
        break;
      }
    }
  }
}
