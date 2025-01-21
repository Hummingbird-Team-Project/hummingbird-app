import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/auth/auth_provider.dart';
import '../views/license/licenses_screen.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.logout),
          title: const Text('로그아웃'),
          onTap: () async {
            ref.read(authProvider.notifier).logout();
          },
        ),
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.description),
          title: const Text('라이센스'),
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OssLicensesScreen(),
            ));
          },
        ),
      ],
    );
  }
}
