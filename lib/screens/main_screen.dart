import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wemovies_mobile_test/repositories/card_movie_repository.dart';
import 'package:wemovies_mobile_test/viewmodel/main_view_model.dart';
import 'package:wemovies_mobile_test/widgets/custom_bottom_nav_widget.dart';

import '../enum/app_navbar_enum.dart';
import '../views/home_view.dart';
import '../views/profile_view.dart';
import '../views/shopping_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final movieRepository = CardMovieRepository(dio: Dio());
  late MainViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = MainViewModel();
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
            AppNavBarEnum.shopping => ShoppingView(
                movieRepository: movieRepository,
                viewModel: viewModel,
              ),
            AppNavBarEnum.profile =>
              ProfileView(movieRepository: movieRepository),
            _ => HomeView(
                movieRepository: movieRepository,
                viewModel: viewModel,
              ),
          };
        },
      ),
      bottomNavigationBar: CustomBottomNavWidget(viewModel: viewModel),
    );
  }
}
