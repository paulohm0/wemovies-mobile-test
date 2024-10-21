import 'package:flutter/material.dart';

import '../repositories/card_movie_repository.dart';

final class ProfileView extends StatelessWidget {
  final CardMovieRepository movieRepository;

  const ProfileView({super.key, required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF2F2E41),
      child: const Text("Profile"),
    );
  }
}
