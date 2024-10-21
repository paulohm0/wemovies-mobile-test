import 'package:flutter/material.dart';

class CustomBottomNavWidget extends StatefulWidget {
  const CustomBottomNavWidget({super.key});

  @override
  _CustomBottomNavWidgetState createState() => _CustomBottomNavWidgetState();
}

class _CustomBottomNavWidgetState extends State<CustomBottomNavWidget> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF1D1D2B),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _NavBarItem(
            icon: Icons.shopping_cart_outlined,
            label: "Carrinho",
            index: 0,
            isSelected: _selectedIndex == 0,
            onTap: () {
              _onItemTapped(0);
            },
          ),
          _NavBarItem(
            icon: Icons.home_outlined,
            label: "Home",
            index: 1,
            isSelected: _selectedIndex == 1,
            onTap: () {
              _onItemTapped(1);
            },
          ),
          _NavBarItem(
            icon: Icons.person_2_outlined,
            label: "Perfil",
            index: 2,
            isSelected: _selectedIndex == 2,
            onTap: () {
              _onItemTapped(2);
            },
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
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.blue : Colors.white,
              ),
              const SizedBox(height: 4.0),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.white,
                  fontSize: isSelected ? 16 : 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
