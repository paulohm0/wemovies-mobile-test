import 'package:flutter/material.dart';

class CustomBottomNavWidget extends StatelessWidget {
  const CustomBottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      color: Color(0xFF1D1D2B),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _NavBarItem(
            icon: Icons.shopping_cart_outlined,
            label: "Carrinho",
            index: 0,
          ),
          _NavBarItem(
            icon: Icons.home_outlined,
            label: "Home",
            index: 1,
          ),
          _NavBarItem(
            icon: Icons.person_2_outlined,
            label: "Perfil",
            index: 2,
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
  });

  final IconData icon;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
