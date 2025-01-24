import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/utils.dart';

class InquiryButtonWidget extends StatelessWidget {
  const InquiryButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(vertical: -4),
      onTap: () {
        sendEmail(context);
      },
      leading: Icon(
        Icons.mail_outline_rounded,
        size: leadingIconSize,
      ),
      title: Text(
        '문의하기',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: trailingIconSize,
      ),
    );
  }

  double get trailingIconSize => 16.w;
  double get leadingIconSize => 20.w;
}
