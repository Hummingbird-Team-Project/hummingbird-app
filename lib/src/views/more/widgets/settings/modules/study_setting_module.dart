import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hummingbird/src/viewmodels/study_setting/study_setting_view_model.dart';

import '../../../../../../core/enum/mxnRate.dart';
import '../setting_container.dart';
import '../setting_tile.dart';

class StudySettingModule extends ConsumerWidget {
  const StudySettingModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPath = GoRouterState.of(context).uri.path;
    final studySetting = ref.watch(studySettingViewModelProvider);
    final studySettingViewModel =
        ref.read(studySettingViewModelProvider.notifier);
    return SettingContainer(
      settingTiles: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.go('$currentPath/country'),
          child: SettingTile(
            title: '국가',
            selected: Text(
              '대한민국',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.go('$currentPath/group'),
          child: SettingTile(
            title: '그룹',
            selected: Text(
              studySetting.group ?? '',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[700],
              ),
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            final selectedDuration = await showTimePickerBottomModal(
                context, '시간 선택', studySetting.goalDuration);
            if (selectedDuration != null) {
              studySettingViewModel.updateStudySetting(
                  updatedGoalDuration: selectedDuration.inSeconds);
            }
          },
          child: SettingTile(
            title: '목표 공부시간',
            selected: Text(
              formatDuration(studySetting.goalDuration),
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[700],
              ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[700],
              size: 20.w,
            ),
            padBetweenST: 12.w,
          ),
        ),
      ],
      rate: MxNRate.TWOBYONE,
    );
  }

  Future<Duration?> showTimePickerBottomModal(
      BuildContext context, String title, int initialSecond) async {
    Duration selected = Duration(seconds: initialSecond);

    return await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 280.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: TextButton(
                        onPressed: () => Navigator.pop(context, selected),
                        child: Text(
                          '완료',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  initialTimerDuration: selected,
                  onTimerDurationChanged: (newDuration) {
                    selected = newDuration;
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  String formatDuration(int duration) {
    int hour = duration ~/ (60 * 60);
    int minute = (duration % (60 * 60)) ~/ 60;
    int second = duration % 60;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
  }
}
