import 'package:hive/hive.dart';

import '../../../models/setting/study_setting.dart';

class StudySettingLocalDatasource {
  StudySettingLocalDatasource(this._box);

  final Box<StudySetting> _box;

  String get _key => 'studySetting';

  StudySetting getStudySetting() {
    try {
      final studySetting = _box.get(_key);
      return studySetting ?? StudySetting();
    } catch (e) {
      return StudySetting();
    }
  }

  Future<void> updateStudySetting(StudySetting updatedStudySetting) async {
    await _box.put(_key, updatedStudySetting);
  }
}
