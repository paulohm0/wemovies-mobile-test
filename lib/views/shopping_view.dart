import 'package:flutter/material.dart';
import 'package:wemovies_mobile_test/viewmodel/main_view_model.dart';
import 'package:wemovies_mobile_test/widgets/shopping_card_empty_widget.dart';
import 'package:wemovies_mobile_test/widgets/shopping_movie_list_widget.dart';

import '../repositories/card_movie_repository.dart';
import '../widgets/shopping_completed_success_widget.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView(
      {super.key, required this.movieRepository, required this.viewModel});

  final CardMovieRepository movieRepository;
  final MainViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return viewModel.isOrderFinalized
              ? ShoppingCompletedSuccessWidget(
                  viewModel: viewModel,
                )
              : SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Carrinho de Compras',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: viewModel.shoppingList.isEmpty
                              ? ShoppingCardEmptyWidget(viewModel: viewModel)
                              : ShoppingMovieListWidget(viewModel: viewModel),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
