// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/imgs/download.png"),
              SizedBox(height: 40),
              Text(
              " learn flutter!",
              style: TextStyle(fontSize: 30, color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
                onPressed: switchScreen,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.arrow_right),
                label: const Text('start Quiz'))
          ],
        ),
      ),
    );
  }
}
