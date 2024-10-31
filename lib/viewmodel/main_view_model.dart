import 'package:flutter/material.dart';
import 'package:wemovies_mobile_test/repositories/card_movie_repository.dart';

import '../enum/app_navbar_enum.dart';
import '../models/card_movie_model.dart';

enum HomeState {
  loading,
  loaded,
  error,
}

final class MainViewModel extends ChangeNotifier {
  final CardMovieRepository _cardMovieRepository;

  AppNavBarEnum selectedIndex = AppNavBarEnum.home;
  List<CardMovieModel> shoppingList = [];
  bool isOrderFinalized = false;
  List<CardMovieModel> listFromMovieApi = [];
  HomeState homeState = HomeState.loading;
  bool isLoading = false;

  MainViewModel({
    required CardMovieRepository cardMovieRepository,
  }) : _cardMovieRepository = cardMovieRepository;

  Future<void> fetchMovies() async {
    try {
      homeState = HomeState.loading;
      final apiResponse = await _cardMovieRepository.getMovies();
      listFromMovieApi.clear();
      listFromMovieApi.addAll(apiResponse);
    } catch (e, st) {
      homeState = HomeState.error;
    } finally {
      homeState = HomeState.loaded;
    }
    notifyListeners();
  }

  void orderFinalized() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3));
    isLoading = false;
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
