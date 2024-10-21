import 'package:flutter/material.dart';

enum AppNavBarEnum {
  shopping(
    label: 'Carrinho',
    icon: Icons.shopping_cart_outlined,
  ),
  home(
    label: "Home",
    icon: Icons.home_outlined,
  ),
  profile(
    icon: Icons.person_2_outlined,
    label: "Perfil",
  );

  final IconData icon;
  final String label;

  const AppNavBarEnum({
    required this.icon,
    required this.label,
  });
}
