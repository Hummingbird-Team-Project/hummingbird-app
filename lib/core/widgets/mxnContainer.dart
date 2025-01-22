// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../enum/mxnRate.dart';
import '../theme/colors/app_color.dart';

// 사용방법
// MxN_rate : 가로 세로 비율을 정함
// MxN_child : 넣을 위젯을 정함

class MxNcontainer extends StatelessWidget {
  MxNcontainer({
    super.key,
    required this.MxN_rate,
    required this.MxN_child,
    this.color,
  });

  final MxNRate MxN_rate;
  final Widget MxN_child;
  Color? color;

  // ignore: unused_element
  double _calcPixel(int rate) {
    final double pixelRate = 40.w;

    double result = 0.0;

    result = rate * pixelRate;
    result = rate == 2 ? result : result + 16;

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: SizedBox(
        width: _calcPixel(MxN_rate.width),
        height: _calcPixel(MxN_rate.height),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: color ?? AppColor.themeGrey, width: 1.w),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: MxN_child,
          ),
        ),
      ),
    );
  }
}
