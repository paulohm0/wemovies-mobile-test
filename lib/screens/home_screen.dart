import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wemovies_mobile_test/repositories/card_movie_repository.dart';

import '../models/card_movie_model.dart';
import '../widgets/card_movie_widget.dart';
import '../widgets/custom_bottom_nav_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final movieRepository = CardMovieRepository(dio: Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          title: const Center(
            child: Text(
              'WeMovies',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          backgroundColor: const Color(0xFF1D1D2B),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xFF2F2E41),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mais vendidos',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                'Maiores sucessos do WeMovies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Expanded(
                child: FutureBuilder<List<CardMovieModel>>(
                  future: movieRepository.getMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Text('Sem Conexão com a Internet');
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      late List<CardMovieModel> cardMovieList =
                          snapshot.data ?? [];
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: cardMovieList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final CardMovieModel cardMovieModel =
                              cardMovieList[index];
                          return CardMovie(
                            imageMovie: cardMovieModel.imageMovie,
                            priceMovie: cardMovieModel.priceMovie,
                            titleMovie: cardMovieModel.titleMovie,
                          );
                        },
                      );
                    } else {
                      return const Text("Nenhum dado encontrado");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavWidget(),
    );
  }
}
