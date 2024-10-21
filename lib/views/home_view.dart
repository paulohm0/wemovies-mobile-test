import 'package:flutter/material.dart';

import '../models/card_movie_model.dart';
import '../repositories/card_movie_repository.dart';
import '../widgets/card_movie_widget.dart';

final class HomeView extends StatelessWidget {
  final CardMovieRepository movieRepository;

  const HomeView({super.key, required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
