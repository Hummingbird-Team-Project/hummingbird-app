import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hummingbird/src/viewmodels/study_setting/study_setting_view_model.dart';
import 'package:intl/intl.dart';

import '../../../../../core/enum/mxnRate.dart';
import '../../../../../core/widgets/mxnContainer.dart';
import '../../../../viewmodels/study_record/study_record_viewmodel.dart';
import '../../../statistics/widgets/bar_charts/study_bar_chart_module.dart';
import '../../../statistics/widgets/pie_charts/study_pie_chart_module.dart';
import 'goal_progress_module.dart';

class DailySummaryModule extends ConsumerWidget {
  const DailySummaryModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studyRecordsState = ref.watch(studyRecordViewModelProvider);
    final studyRecordViewModel =
        ref.read(studyRecordViewModelProvider.notifier);
    studyRecordViewModel.loadStudyRecordsByDate(_today);
    return studyRecordsState.when(
      data: (data) {
        final studyRecords =
            studyRecordViewModel.loadMergedStudyRecordsByDate(data);
        final goalDuration =
            ref.watch(studySettingViewModelProvider).goalDuration;
        if (studyRecords.isEmpty) {
          return SingleChildScrollView(
            child: Column(
              children: [
                GoalProgressModule(
                    totalStudyDuration: 0, goalDuration: goalDuration),
                MxNcontainer(
                  MxN_rate: MxNRate.TWOBYONE,
                  MxN_child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text('오늘 기록된 데이터가 없습니다'),
                    ),
                  ),
                )
              ],
            ),
          );
        }

        final (subjectTitleList, studyDurationList, subjectColorList) =
            studyRecordViewModel.getStudyRecordsInfo(studyRecords);

        // 파이 차트에서 사용할 때 내림차 순으로 정렬
        final (sortedTitleList, sortedDurationList, sortedColorList) =
            studyRecordViewModel.getStudyRecordsInfo(
                studyRecordViewModel.sortStudyRecords(studyRecords));

        final totalStudyDuration = studyDurationList.fold(0, (a, b) => a + b);

        return SingleChildScrollView(
          child: Column(
            children: [
              GoalProgressModule(
                totalStudyDuration: totalStudyDuration,
                goalDuration: goalDuration,
              ),
              StudyPieChartModule(
                subjectTitleList: sortedTitleList,
                studyDurationList: sortedDurationList,
                subjectColorList: sortedColorList,
                totalStudyDuration: totalStudyDuration,
              ),
              StudyBarChartModule(
                  subjectTitleList: subjectTitleList,
                  studyDurationList: studyDurationList,
                  subjectColorList: subjectColorList)
            ],
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
      loading: () => Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }

  String get _today {
    final today = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(today);
  }
}
