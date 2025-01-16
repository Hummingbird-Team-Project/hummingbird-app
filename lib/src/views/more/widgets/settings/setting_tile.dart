import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingTile extends StatelessWidget {
  const SettingTile(
      {super.key,
      required this.title,
      this.selected,
      this.onTap,
      this.leading,
      this.trailing,
      this.padBetweenST});

  final String title;
  final Widget? leading;
  final Widget? selected;
  final Widget? trailing;
  final double? padBetweenST;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          selected ?? Text(''),
          SizedBox(width: padBetweenST ?? 16.w),
          trailing ??
              Icon(
                Icons.arrow_forward_ios,
                size: iconSize,
                color: Colors.grey[700],
              )
        ],
      ),
    );
  }

  double get iconSize => 16.w;
}
