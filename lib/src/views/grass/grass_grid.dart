import 'package:flutter/material.dart';
import '../../models/grass/grass_data_model.dart';

class StudyGrid extends StatefulWidget {
  /// studyData 매개변수를 통해 학습 데이터 리스트를 전달받음
  final List<GrassDataModel> studyData;

  const StudyGrid({super.key, required this.studyData});

  @override
  _StudyGridState createState() => _StudyGridState();
}

class _StudyGridState extends State<StudyGrid> {
  /// 표시할 주의 개수 (가로 그리드 수)
  final int weeksToShow = 16;

  /// 시작 날짜를 현재로부터 15주 전으로 설정
  late final DateTime startDate;

  /// 현재 시스템의 UTC 시간대 오프셋 (시간 단위)
  final utcOffset = DateTime.now().timeZoneOffset.inHours;

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now().subtract(Duration(days: 7 * (weeksToShow - 1)));
  }

  /// 기준날짜를 기준으로 첫번째 일요일 날짜를 구하는 메서드
  ///
  /// 만약 시작 날짜가 일요일이 아니라면:
  /// 1. 현재 요일(weekday)만큼 일수를 빼서 직전 일요일을 구함
  /// 2. 시작 날짜가 일요일이면 그대로 반환
  ///
  /// Returns [DateTime] 해당 주의 일요일 날짜
  DateTime getFirstSunday() {
    final firstDay = startDate;
    if (firstDay.weekday != DateTime.sunday) {
      return firstDay.subtract(Duration(days: firstDay.weekday));
    }
    return firstDay;
  }

  /// 날짜와 해당 일자의 학습 시간을 보여주는 다이얼로그를 표시하는 메서드
  ///
  /// [context] - 다이얼로그를 표시할 BuildContext
  /// [date] - 표시할 날짜
  /// [studyCount] - 해당 날짜의 학습 시간
  ///
  /// AlertDialog를 사용하여 다음 정보를 표시:
  /// - 년/월/일 형식의 날짜
  /// - 해당 일자의 총 학습 시간
  /// - 다이얼로그를 닫을 수 있는 '닫기' 버튼
  ///
  /// 다이얼로그의 배경색은 다크 테마를 사용 (0xFF2D2D2D)
  void _showDateDialog(BuildContext context, DateTime date, int studyCount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2D2D2D),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${date.year}년 ${date.month}월 ${date.day}일',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '학습시간 : $studyCount시간',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                '닫기',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gridSize = size.width * 0.98;
    final itemSize = (gridSize - (15 * 5)) / 7;

    return SizedBox(
      width: gridSize,
      height: itemSize * 4,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: weeksToShow * 7,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: weeksToShow,
          childAspectRatio: 1,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (BuildContext context, int index) {
          DateTime currentDate = calculateCurrentDate(index);
          int studyCount = getStudyCount(currentDate);
          Color color = getStudyColor(currentDate, studyCount);

          bool isFirstDayOfMonth = currentDate.day == 1;

          return Tooltip(
            message:
                '${currentDate.year}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}\n$studyCount studies',
            child: InkWell(
              onTap: () {
                _showDateDialog(context, currentDate, studyCount);
              },
              child: Container(
                decoration: ShapeDecoration(
                  color: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                child: isFirstDayOfMonth
                    ? Center(
                        child: Text(
                          currentDate.month.toString(),
                          style: TextStyle(
                            color:
                                studyCount > 0 ? Colors.white : Colors.white70,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }

  /// 그리드 내의 특정 인덱스에 해당하는 날짜를 계산합니다.
  ///
  /// [index]는 그리드 내의 위치를 나타냅니다.
  /// 로직은 다음과 같습니다:
  /// 1. dayIndex: 요일을 계산 (0=일요일, 1=월요일, ...)
  /// 2. weekIndex: 몇 번째 주차인지 계산
  /// 3. 첫 번째 일요일부터 시작하여 마지막 날짜를 계산
  /// 4. 현재 주의 시작일을 구한 후
  /// 5. 최종적으로 특정 요일의 날짜를 반환
  ///
  /// [weeksToShow]는 보여줄 총 주차 수입니다.
  ///
  /// 반환값은 계산된 [DateTime] 객체입니다.
  DateTime calculateCurrentDate(int index) {
    int dayIndex = index ~/ weeksToShow;
    int weekIndex = (weeksToShow - 1) - (index % weeksToShow);

    final firstSunday = getFirstSunday();
    final lastDay = firstSunday.add(Duration(days: (weeksToShow - 1) * 7));
    final currentWeekStart = lastDay.subtract(Duration(days: weekIndex * 7));
    return currentWeekStart.add(Duration(days: dayIndex));
  }

  /// 특정 날짜의 공부 횟수를 반환하는 메서드
  ///
  /// [date] - 조회하고자 하는 날짜
  ///
  /// 로직:
  /// 1. 입력받은 날짜를 정규화(시간, 분, 초를 0으로 설정)
  /// 2. 해당 날짜의 시작 시간(00:00:00)과 종료 시간(23:59:59)을 Unix timestamp로 변환
  /// 3. widget.studyData에서 해당 시간 범위 내의 데이터를 찾음
  /// 4. 일치하는 데이터가 없는 경우 기본값(studyCount: 0) 반환
  /// 5. 찾은 데이터의 studyCount 값을 반환
  ///
  /// Returns: int 형태의 공부 횟수
  int getStudyCount(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final startOfDay = normalizedDate.millisecondsSinceEpoch ~/ 1000;
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59)
            .millisecondsSinceEpoch ~/
        1000;

    final studyInfo = widget.studyData.firstWhere(
      (data) => data.studyDay >= startOfDay && data.studyDay <= endOfDay,
      orElse: () =>
          GrassDataModel(studyDay: 0, studyCount: 0), // 일치하는 데이터가 없을 때의 기본값
    );

    return studyInfo.studyCount;
  }

  Color getStudyColor(DateTime date, int studyCount) {
    bool isFirstDayOfMonth = date.day == 1;
    DateTime now = DateTime.now();
    bool isCurrentMonth = date.year == now.year && date.month == now.month;

    if (studyCount == 0) {
      if (isCurrentMonth) {
        return const Color.fromARGB(255, 88, 88, 88); // 현재 월의 날짜는 연한 회색입니다
      }
      return const Color(0xFF242424); // 다른 월은 어두운 회색입니다
    }
    if (studyCount == 1)
      return isFirstDayOfMonth
          ? const Color(0xFF0F5539)
          : const Color(0xFF0E4429); // 어두운 녹색
    if (studyCount >= 2 && studyCount <= 3)
      return isFirstDayOfMonth
          ? const Color(0xFF007D42)
          : const Color(0xFF006D32); // 중간 녹색
    if (studyCount >= 4 && studyCount <= 5)
      return isFirstDayOfMonth
          ? const Color(0xFF2AB651)
          : const Color(0xFF26A641); // 밝은 녹색
    return isFirstDayOfMonth
        ? const Color(0xFF4AE363)
        : const Color(0xFF39D353); // 가장 밝은 녹색
  }
}
