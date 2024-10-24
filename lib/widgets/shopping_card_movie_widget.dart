import 'package:flutter/material.dart';
import 'package:wemovies_mobile_test/models/card_movie_model.dart';
import 'package:wemovies_mobile_test/viewmodel/main_view_model.dart';

class ShoppingCardMovieWidget extends StatelessWidget {
  const ShoppingCardMovieWidget({
    super.key,
    required this.cardMovieModel, required this.viewModel,
  });

  final CardMovieModel cardMovieModel;
  final MainViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.day}/${currentDate.month}/${currentDate.year}";

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
              width: 56,
              height: 72,
              //Todo: Substituir image.network, pela imagem do filme vinda da api
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.network(
                  cardMovieModel.imageMovie.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 7.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardMovieModel.titleMovie.toString(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Adicionado em ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA1A1A1),
                          ),
                        ),
                        TextSpan(
                          text: formattedDate,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFA1A1A1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.blue,
                    size: 18,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    viewModel.addMovieToCart(cardMovieModel);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 18,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'SUBTOTAL',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                Text(
                  cardMovieModel.priceMovie!.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        const Divider(),
      ],
    );
  }
}
