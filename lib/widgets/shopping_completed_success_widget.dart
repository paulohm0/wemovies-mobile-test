import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wemovies_mobile_test/viewmodel/main_view_model.dart';

import '../enum/app_navbar_enum.dart';

class ShoppingCompletedSuccessWidget extends StatelessWidget {
  final MainViewModel viewModel;
  const ShoppingCompletedSuccessWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.day}/${currentDate.month}/${currentDate.year}";
    String formattedTime = DateFormat('HH:mm').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Compra realizada em ',
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
                    const TextSpan(
                      text: ' ás ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFA1A1A1),
                      ),
                    ),
                    TextSpan(
                      text: formattedTime,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFA1A1A1),
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text(
                  'Compra realizada com sucesso !',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Image.asset(
                  'assets/finish.png',
                ),
              ),
              ElevatedButton(
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
                onPressed: () {
                  viewModel.onItemTapped(AppNavBarEnum.home);
                  viewModel.orderReset();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Voltar à Home',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
