import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wemovies_mobile_test/models/card_movie_model.dart';
import 'package:wemovies_mobile_test/repositories/card_movie_repository.dart';
import 'package:wemovies_mobile_test/screens/home_view_model.dart';
import 'package:wemovies_mobile_test/widgets/card_movie_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final movieRepository = CardMovieRepository(dio: Dio());
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel();
  }

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
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          return switch (viewModel.selectedIndex) {
            AppNavBarEnum.shopping =>
              _ShoppingView(movieRepository: movieRepository),
            AppNavBarEnum.profile =>
              _ProfileView(movieRepository: movieRepository),
            AppNavBarEnum.deposit =>
              _ProfileView(movieRepository: movieRepository),
            _ => _HomeView(movieRepository: movieRepository),
          };
        },
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return BottomAppBar(
            color: const Color(0xFF1D1D2B),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (AppNavBarEnum nav in AppNavBarEnum.values)
                  _NavBarItem(
                    icon: nav.icon,
                    label: nav.label,
                    index: nav.index,
                    isSelected: viewModel.selectedIndex.label == nav.label,
                    onTap: () {
                      viewModel.onItemTapped(nav);
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

final class _HomeView extends StatelessWidget {
  final CardMovieRepository movieRepository;

  const _HomeView({super.key, required this.movieRepository});

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

final class _ShoppingView extends StatelessWidget {
  final CardMovieRepository movieRepository;

  const _ShoppingView({super.key, required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF2F2E41),
      child: Text("Shopping"),
    );
  }
}

final class _ProfileView extends StatelessWidget {
  final CardMovieRepository movieRepository;

  const _ProfileView({super.key, required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF2F2E41),
      child: Text("Profile"),
    );
  }
}

final class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.blue : Colors.white,
              ),
              const SizedBox(height: 4.0),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.white,
                  fontSize: isSelected ? 16 : 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
