import 'package:flutter/material.dart';

class CustomBottomNavWidget extends StatelessWidget {
  const CustomBottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF1D1D2B),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          navBarItem(Icons.shopping_cart_outlined, "Carrinho", 0),
          navBarItem(Icons.home_outlined, "Home", 1),
          navBarItem(Icons.person_2_outlined, "Perfil", 2),
        ],
      ),
    );
  }

  Widget navBarItem(IconData icon, String label, int index) {
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
