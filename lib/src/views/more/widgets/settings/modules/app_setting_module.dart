import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hummingbird/core/enum/mxnRate.dart';
import 'package:hummingbird/src/viewmodels/app_setting/app_setting_view_model.dart';
import 'package:hummingbird/src/views/more/widgets/settings/setting_container.dart';
import 'package:hummingbird/src/views/more/widgets/settings/setting_tile_with_seg.dart';

import '../../../../../../core/enum/font_size.dart';
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

  void selectFontSize(Set<FontSize> newSelection) async {
    final updatedFontSize = switch (newSelection.first) {
      FontSize.SMALL => 2,
      FontSize.MEDIUM => 4,
      _ => 6
    };
    ref
        .read(appSettingViewModelProvider.notifier)
        .updateAppSetting(updatedFontSize: updatedFontSize);
    setState(() {
      selectedFontSize = newSelection.first;
    });
  }

  @override
  void initState() {
    super.initState();
    final currentFontSize = ref.read(appSettingViewModelProvider).fontSize;
    selectedFontSize = switch (currentFontSize) {
      2 => FontSize.SMALL,
      4 => FontSize.MEDIUM,
      _ => FontSize.LARGE,
    };
  }

  @override
  Widget build(BuildContext context) {
    final String currentRouterPath = GoRouterState.of(context).uri.path;
    return SettingContainer(
        settingTiles: getSettingTiles(currentRouterPath),
        rate: MxNRate.TWOBYONE);
  }

  List<Widget> getSettingTiles(String currentRouterPath) {
    return [
      SettingTile(
        title: '테마 색상',
        trailing: Text(
          '향후 추가할 계획 입니다',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 12.sp,
          ),
        ),
      ),
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => context.go('$currentRouterPath/language'),
        child: SettingTile(
          title: '언어',
          selected: Text(
            '한국어',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[700],
            ),
          ),
        ),
      ),
      SettingTileWithSeg<FontSize>(
        title: '글자 크기',
        selected: selectedFontSize,
        segments: _segments,
        selectButton: selectFontSize,
      ),
    ];
  }
}
