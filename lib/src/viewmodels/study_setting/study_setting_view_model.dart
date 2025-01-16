import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/setting/study_setting.dart';
import '../../repositories/study_setting/study_setting_repository.dart';

part 'study_setting_view_model.g.dart';

@riverpod
class StudySettingViewModel extends _$StudySettingViewModel {
  late final StudySettingRepository repository;
  @override
  StudySetting build() {
    repository = ref.watch(studySettingRepositoryProvider);
    return repository.getStudySetting();
  }

  Future<void> updateStudySetting(
      {int? updatedGoalDuration,
      int? updatedCountry,
      String? updatedGroup}) async {
    final currentSetting = repository.getStudySetting();
    final updatedStudySetting = currentSetting.copyWith(
        goalDuration: updatedGoalDuration ?? currentSetting.goalDuration,
        country: updatedCountry ?? currentSetting.country,
        group: updatedGroup ?? currentSetting.group);
    await repository.updateStudySetting(updatedStudySetting);
    state = updatedStudySetting;
  }
}
