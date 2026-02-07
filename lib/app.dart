import 'package:flutter/material.dart';

import 'main_index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the utility here
    ResponsiveUtils().init(context);

    return MaterialApp.router(
      title: 'Pinterest',
      debugShowCheckedModeBanner: false,
    );
  }
}
