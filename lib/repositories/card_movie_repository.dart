import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wemovies_mobile_test/models/card_movie_model.dart';

class CardMovieRepository {
  final Dio dio;
  CardMovieRepository({required this.dio});

  Future<List<CardMovieModel>> getMovies() async {
    try {
      final apiResponse =
          await dio.get('https://wefit-movies.vercel.app/api/movies');
      return List.from(apiResponse.data["products"])
          .map((movie) => CardMovieModel.fromJson(movie))
          .toList();
    } catch (error, st) {
      log(
        "Um erro ocorreu ao tentar acessar a lista de Filmes",
        error: error,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
