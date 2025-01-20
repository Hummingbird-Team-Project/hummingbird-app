import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/router.dart';
import 'core/utils/show_snack_bar.dart';
import 'src/app_initialize.dart';
import 'src/viewmodels/app_setting/app_setting_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 어플리케이션 세로모드
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized(); //다국어 지원을 위한 초기화
  await appInitialize();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        // 지원 언어 설정
        Locale('ko', 'KR'), //kr-KR.json
        Locale('en', 'US'), //en-US.json
        Locale('ja', 'JP'), //jp-Jp.json
        Locale('zh', 'CN'), //zh-CN.json
        Locale('vi', 'VN'), //vi-VN.json
        Locale('th', 'TH'), //th-TH.json
      ],
      path: 'lib/core/translations', //번역 파일 경로
      fallbackLocale: const Locale('en', 'US'), //지원하지 않는 언어일 경우 영어로 설정
      startLocale: PlatformDispatcher.instance.locale, //디바이스 언어로 시작
      child: const ProviderScope(child: MyApp()),
    ),
  );
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
        localizationsDelegates:
            context.localizationDelegates, //다국어 지원을 위한 델리게이트 설정
        supportedLocales: context.supportedLocales, //  지원 언어 설정
        locale: context.locale, // 현재 언어 설정
      ),
    );
  }
}
