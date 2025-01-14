import 'package:flutter/material.dart';

import '../../../../core/router/bottom_nav_bar.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Text("SocialScreen"),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
