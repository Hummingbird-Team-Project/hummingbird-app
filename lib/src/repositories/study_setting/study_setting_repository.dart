import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/const/box_keys.dart';
import '../../datasource/local/study_setting/study_setting_local_datasource.dart';
import '../../models/setting/study_setting.dart';

part 'study_setting_repository.g.dart';

@riverpod
StudySettingRepository studySettingRepository(Ref ref) {
  final box = Hive.box<StudySetting>(BoxKeys.studySettingBoxKey);
  final studySettingLocalDatasource = StudySettingLocalDatasource(box);
  return StudySettingRepository(studySettingLocalDatasource);
}

class StudySettingRepository {
  StudySettingRepository(this.localDatasource);

  StudySettingLocalDatasource localDatasource;

  StudySetting getStudySetting() {
    return localDatasource.getStudySetting();
  }

  Future<void> updateStudySetting(StudySetting updatedStudySetting) async {
    await localDatasource.updateStudySetting(updatedStudySetting);
  }
}
