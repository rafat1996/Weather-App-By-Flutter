import 'package:flutter/material.dart';


class NoWeatherWidget extends StatelessWidget {
  const NoWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'There is no Weather',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Searching Now 🔎',
                      style: TextStyle(fontSize: 20),
                    )
                  ]),
            );
  }
}