import 'package:flutter/material.dart';
import 'package:wemovies_mobile_test/models/card_movie_model.dart';
import 'package:wemovies_mobile_test/viewmodel/main_view_model.dart';
import 'package:wemovies_mobile_test/widgets/home_card_movie_widget.dart';

final class HomeView extends StatefulWidget {
  final MainViewModel viewModel;

  const HomeView({
    super.key,
    required this.viewModel,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchMovies();
  }

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
              child: ListenableBuilder(
                listenable: widget.viewModel,
                builder: (context, _) {
                  return switch (widget.viewModel.homeState) {
                    HomeState.loading => const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    HomeState.error => const Text('Sem Conexão com a Internet'),
                    HomeState.loaded => ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.viewModel.listFromMovieApi.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final CardMovieModel cardMovieModel =
                              widget.viewModel.listFromMovieApi[index];
                          return HomeCardMovieWidget(
                            cardMovieModel: cardMovieModel,
                            viewModel: widget.viewModel,
                          );
                        },
                      ),
                  };

                  //       if (widget.viewModel.isLoading) {
                  //         return const Center(
                  //             child: CircularProgressIndicator(
                  //           color: Colors.black,
                  //         ));
                  //       } else if (widget.viewModel.hasError) {
                  //         return const Text('Sem Conexão com a Internet');
                  //       }
                  //       return ListView.builder(
                  //         shrinkWrap: true,
                  //         itemCount: widget.viewModel.listFromMovieApi.length,
                  //         scrollDirection: Axis.vertical,
                  //         itemBuilder: (context, index) {
                  //           final CardMovieModel cardMovieModel =
                  //               widget.viewModel.listFromMovieApi[index];
                  //           return HomeCardMovieWidget(
                  //             cardMovieModel: cardMovieModel,
                  //             viewModel: widget.viewModel,
                  //           );
                  //         },
                  //       );
                  //     },
                  //   ),
                  // )

                  // Expanded(
                  //   child: FutureBuilder<List<CardMovieModel>>(
                  //     future: movieRepository.getMovies(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.connectionState == ConnectionState.waiting) {
                  //         return const Center(
                  //             child: CircularProgressIndicator(
                  //           color: Colors.black,
                  //         ));
                  //       } else if (snapshot.hasError) {
                  //         return const Text('Sem Conexão com a Internet');
                  //       } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  //         late List<CardMovieModel> cardMovieList =
                  //             snapshot.data ?? [];
                  //         return ListView.builder(
                  //           shrinkWrap: true,
                  //           itemCount: cardMovieList.length,
                  //           scrollDirection: Axis.vertical,
                  //           itemBuilder: (context, index) {
                  //             final CardMovieModel cardMovieModel =
                  //                 cardMovieList[index];
                  //             return HomeCardMovieWidget(
                  //               cardMovieModel: cardMovieModel,
                  //               viewModel: viewModel,
                  //             );
                  //           },
                  //         );
                  //       } else {
                  //         return const Text("Nenhum dado encontrado");
                  //       }
                  //     },
                  //   ),
                  // ),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
