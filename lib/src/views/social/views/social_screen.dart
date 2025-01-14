import 'package:flutter/material.dart';
import 'package:hummingbird/src/views/splash_screen.dart/splash_screen.dart';

import '../../../../core/router/bottom_nav_bar.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SplashScreen()),
              );
            },
            child: Text("splashScreen")),
        // child: Center(
        //   child: Text("SocialScreen"),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
