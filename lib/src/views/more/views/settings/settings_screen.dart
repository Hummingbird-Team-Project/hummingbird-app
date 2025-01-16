import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hummingbird/src/views/more/widgets/settings/modules/app_setting_module.dart';
import 'package:hummingbird/src/views/more/widgets/settings/modules/study_setting_module.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        title: Text('설정'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              AppSettingModule(),
              StudySettingModule(),
            ],
          ),
        ),
      ),
    );
  }
}
