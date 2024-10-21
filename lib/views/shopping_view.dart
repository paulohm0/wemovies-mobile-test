import 'package:flutter/material.dart';

import '../repositories/card_movie_repository.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key, required this.movieRepository});

  final CardMovieRepository movieRepository;

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
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
              'Carrinho de Compras',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(''),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
