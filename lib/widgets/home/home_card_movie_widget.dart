import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wemovies_mobile_test/models/card_movie_model.dart';
import 'package:wemovies_mobile_test/viewmodel/main_view_model.dart';

class HomeCardMovieWidget extends StatefulWidget {
  final CardMovieModel cardMovieModel;
  final MainViewModel viewModel;

  const HomeCardMovieWidget({
    super.key,
    required this.viewModel,
    required this.cardMovieModel,
  });

  @override
  State<HomeCardMovieWidget> createState() => _HomeCardMovieWidgetState();
}

class _HomeCardMovieWidgetState extends State<HomeCardMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 8.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 147,
                height: 188,
                child: CachedNetworkImage(
                  imageUrl: widget.cardMovieModel.imageMovie!,
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            Text(
              widget.cardMovieModel.titleMovie ?? 'Nome não Disponível',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'R\$ ${widget.cardMovieModel.priceMovie != null ? widget.cardMovieModel.priceMovie!.toStringAsFixed(2) : 'Valor não Disponível'}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0, left: 16.0, bottom: 16.0, top: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.viewModel.shoppingList.any((movie) =>
                          movie.idMovie == widget.cardMovieModel.idMovie)
                      ? Colors.green
                      : Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  widget.viewModel.addMovieToCart(widget.cardMovieModel);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                      Text(
                        widget.viewModel
                            .countItensShop(widget.cardMovieModel)
                            .toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Text(
                        'ADICIONAR AO CARRINHO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
