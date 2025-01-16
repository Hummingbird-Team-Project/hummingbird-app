import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hummingbird/core/enum/mxnRate.dart';
import 'package:hummingbird/src/views/more/widgets/setting_container.dart';
import 'package:hummingbird/src/views/more/widgets/setting_tile_with_seg.dart';

import '../../../../../core/enum/font_size.dart';
import '../setting_tile.dart';

class AppSettingModule extends ConsumerStatefulWidget {
  const AppSettingModule({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AppSettingModuleState();
}

class _AppSettingModuleState extends ConsumerState<AppSettingModule> {
  FontSize selectedFontSize = FontSize.MEDIUM;

  final List<ButtonSegment<FontSize>> _segments = [
    ButtonSegment(value: FontSize.SMALL, label: Text('소')),
    ButtonSegment(value: FontSize.MEDIUM, label: Text('중')),
    ButtonSegment(value: FontSize.LARGE, label: Text('대')),
  ];

  void selectFontSize(Set<FontSize> newSelection) {
    setState(() {
      selectedFontSize = newSelection.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SettingContainer(settingTiles: settingTiles, rate: MxNRate.TWOBYONE);
  }

  List<Widget> get settingTiles {
    return [
      SettingTile(title: '테마'),
      SettingTileWithSeg<FontSize>(
        title: '글자 크기',
        selected: selectedFontSize,
        segments: _segments,
        selectButton: selectFontSize,
      ),
      SettingTile(
        title: '언어',
        selected: DropdownButton<Locale>(
          value: context.locale, // 현재 언어 설정
          onChanged: (Locale? newLocale) {
            if (newLocale != null) {
              setState(() {
                context.setLocale(newLocale);
              });
            }
          },

          //todo : 다국어 지원을 위한 설정, 배포전 수정 필요
          // items: [
          //   DropdownMenuItem(
          //     value: const Locale('ko', 'KR'),
          //     child: Text('한국어'),
          //   ),
          // ],

          items: [
            DropdownMenuItem(
              value: const Locale('ko', 'KR'),
              child: Text('한국어'),
            ),
            DropdownMenuItem(
              value: const Locale('en', 'US'),
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: const Locale('ja', 'JP'),
              child: Text('日本語'),
            ),
            DropdownMenuItem(
              value: const Locale('zh', 'CN'),
              child: Text('中文'),
            ),
            DropdownMenuItem(
              value: const Locale('vi', 'VN'),
              child: Text('Tiếng Việt'),
            ),
            DropdownMenuItem(
              value: const Locale('th', 'TH'),
              child: Text('ไทย'),
            ),
          ],
        ),
      ),
    ];
  }
}
