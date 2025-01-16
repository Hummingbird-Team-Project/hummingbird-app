import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hummingbird/core/utils/show_snack_bar.dart';
import 'package:hummingbird/src/app_initialize.dart';

import 'core/router/router.dart';
import 'src/viewmodels/app_setting/app_setting_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await appInitialize();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final appSetting = ref.watch(appSettingViewModelProvider);
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        routerConfig: goRouter,
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'HummingBird',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: (8 + appSetting.fontSize).sp)),
          splashFactory: NoSplash.splashFactory,
          useMaterial3: true,
        ),
      ),
    );
  }
}
