class GrassDataModel {
  final int studyDay; // 날짜 (밀리초 단위의 에포크 시간)
  final int studyCount; // 학습 횟수

  // 생성자
  GrassDataModel({
    required this.studyDay,
    required this.studyCount,
  });

  // JSON을 객체로 변환하는 생성자
  factory GrassDataModel.fromJson(Map<String, dynamic> json) {
    return GrassDataModel(
      studyDay: json['study_day'],
      studyCount: json['study_count'],
    );
  }

  // 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'study_day': studyDay,
      'study_count': studyCount,
    };
  }

  // 날짜를 DateTime으로 반환하는 메서드 (에포크 시간을 DateTime 객체로 변환)
  DateTime get studyDateTime => DateTime.fromMillisecondsSinceEpoch(studyDay);
}
