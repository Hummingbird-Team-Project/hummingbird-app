import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../providers/auth/auth_provider.dart';

class LogoutButtonWidget extends ConsumerWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(vertical: -4),
      onTap: () {
        ref.read(authProvider.notifier).logout();
      },
      leading: Icon(
        Icons.logout_rounded,
        size: leadingIconSize,
      ),
      title: Text(
        '로그아웃',
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
