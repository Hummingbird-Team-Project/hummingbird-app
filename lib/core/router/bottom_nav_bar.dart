import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(context),
      selectedFontSize: 12,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/');
            break;
          case 1:
            context.go('/social');
            break;
          case 2:
            showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (context) => SizedBox(
                width: double.maxFinite,
                height: 400,
              ),
            );
            break;
          case 3:
            context.go('/statistics');
            break;
          case 4:
            context.go('/more');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: tr('홈'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups),
          label: tr('소셜'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timer),
          label: tr('타이머'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_rounded),
          label: tr('통계'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz_rounded),
          label: tr('더보기'),
        ),
      ],
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();
    switch (currentPath) {
      case '/':
        return 0;
      case '/social':
        return 1;
      case '/timer':
        return 2;
      case '/statistics':
        return 3;
      case '/more':
        return 4;
      default:
        return 0;
    }
  }
}
