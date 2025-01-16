import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/enum/mxnRate.dart';
import '../../../../core/widgets/mxnContainer.dart';

class OptionsContainerModule extends StatelessWidget {
  const OptionsContainerModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MxNcontainer(
      MxN_rate: MxNRate.TWOBYONE,
      MxN_child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity(vertical: -4),
              onTap: () {
                context.go('/more/settings');
              },
              leading: Icon(
                Icons.settings_outlined,
                size: leadingIconSize,
              ),
              title: Text(
                '설정',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: trailingIconSize,
              ),
            ),
            const Divider(),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(
                Icons.notifications_outlined,
                size: leadingIconSize,
              ),
              title: Text(
                '알람',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: trailingIconSize,
              ),
            ),
            const Divider(),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity(vertical: -4),
              onTap: () {},
              leading: Icon(
                Icons.privacy_tip_outlined,
                size: leadingIconSize,
              ),
              title: Text(
                '개인정보 처리방침',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: trailingIconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double get fontSize => 12.sp;
  double get trailingIconSize => 16.w;
  double get leadingIconSize => 20.w;
}
