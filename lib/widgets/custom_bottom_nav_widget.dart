import 'package:flutter/material.dart';
import 'package:wemovies_mobile_test/viewmodel/main_view_model.dart';

import '../enum/app_navbar_enum.dart';
import 'navbar_item_widget.dart';

class CustomBottomNavWidget extends StatelessWidget {
  const CustomBottomNavWidget({super.key, required this.viewModel});

  final MainViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return BottomAppBar(
          color: const Color(0xFF1D1D2B),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (AppNavBarEnum nav in AppNavBarEnum.values)
                NavBarItem(
                  icon: nav.icon,
                  label: nav.label,
                  index: nav.index,
                  isSelected: viewModel.selectedIndex.label == nav.label,
                  onTap: () {
                    viewModel.onItemTapped(nav);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
