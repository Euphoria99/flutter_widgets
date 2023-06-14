import 'package:flutter/material.dart';

import '../widgets/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text(
              'Open Bottom Sheet',
            ),
            onPressed: () {
              showCustomModalBottomSheet(context);
            },
          ),
        ),
      ],
    ));
  }
}
