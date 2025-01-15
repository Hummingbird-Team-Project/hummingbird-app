import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingTileWithSeg<T> extends StatelessWidget {
  const SettingTileWithSeg(
      {super.key,
      required this.title,
      required this.selected,
      required this.segments,
      required this.selectButton});

  final String title;
  final T selected;
  final List<ButtonSegment<T>> segments;
  final void Function(Set<T> newSelection) selectButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        SegmentedButton<T>(
          style: SegmentedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          segments: segments,
          selected: {selected},
          onSelectionChanged: selectButton,
          selectedIcon: Text(''),
          showSelectedIcon: false,
        )
      ],
    );
  }
}
