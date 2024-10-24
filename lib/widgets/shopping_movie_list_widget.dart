import 'package:flutter/material.dart';
import 'package:wemovies_mobile_test/viewmodel/main_view_model.dart';
import 'package:wemovies_mobile_test/widgets/shopping_card_movie_widget.dart';

class ShoppingMovieListWidget extends StatelessWidget {
  const ShoppingMovieListWidget({
    super.key,
    required this.viewModel,
  });

  final MainViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.shoppingList.length,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ShoppingCardMovieWidget(
                viewModel: viewModel,
                cardMovieModel: viewModel.shoppingList[index],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TOTAL',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              Text(
                'R\$ ${viewModel.getSumPrices().toString()}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'FINALIZAR PEDIDO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
