import 'dart:ui';

import 'package:flutter/material.dart';

class AlertDeleteMovieShoppingWidget extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const AlertDeleteMovieShoppingWidget({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Você deseja excluir o filme ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: onConfirm,
                    child: const Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onCancel,
                    child: const Icon(
                      Icons.close,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
