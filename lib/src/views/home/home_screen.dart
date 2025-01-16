import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/router/bottom_nav_bar.dart';
import 'home_seg1_screen.dart';
import 'home_seg2_screen.dart';
import 'home_seg3_screen.dart';

final List<SegmentTab> _tabs = [
  const SegmentTab(label: "타이머", backgroundColor: Colors.red),
  const SegmentTab(label: "디데이", backgroundColor: Colors.orange),
  const SegmentTab(label: "요약", backgroundColor: Colors.yellow),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.lightGreen,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SegmentedTabControl(
              selectedTabTextColor: Colors.black,
              tabPadding: EdgeInsets.zero,
              height: 36.h,
              tabs: _tabs,
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              Seg1Screen(),
              Seg2Screen(),
              Seg3Screen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
