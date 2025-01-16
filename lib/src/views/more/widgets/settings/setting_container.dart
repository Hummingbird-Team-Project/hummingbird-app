import 'package:flutter/material.dart';

import '../../../../../core/enum/mxnRate.dart';
import '../../../../../core/widgets/mxnContainer.dart';

class SettingContainer extends StatelessWidget {
  const SettingContainer(
      {super.key, required this.settingTiles, required this.rate});

  final List<Widget> settingTiles;
  final MxNRate rate;

  @override
  Widget build(BuildContext context) {
    return MxNcontainer(
      MxN_rate: rate,
      MxN_child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: contents,
        ),
      ),
    );
  }

  List<Widget> get contents {
    return [
      for (int i = 0; i < settingTiles.length * 2 - 1; i++)
        if (i % 2 == 0) settingTiles[i ~/ 2] else const Divider(height: 1)
    ];
  }
}
