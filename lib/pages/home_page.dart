import 'package:applifting_tleubayev/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/crew_page.dart';
import '../pages/launches_page.dart';
import '../pages/ships_page.dart';

final indexProvider = StateNotifierProvider((ref) => BottomBarStateNotifier());

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomePage(),
    );
  }

  final List<Widget> pages = [LaunchesPage(), CrewPage(), ShipsPage()];

  final List<BottomNavigationBarItem> navItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.rocket_launch,
        color: Colors.black,
      ),
      label: 'launch',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.circle_notifications_outlined,
        color: Colors.black,
      ),
      label: 'crew',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.directions_boat_filled,
        color: Colors.black,
      ),
      label: 'ships',
    ),
  ];

  @override
  Widget build(context, ref) {
    final pageController = PageController();
    final int menuIndex = ref.watch(indexProvider) as int;
    return FocusAbsorber(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Applifting Spacex',
              style: TextStyle(fontFamily: 'Bruno'),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: menuIndex,
            items: navItems,
            onTap: (int i) {
              ref.read(indexProvider.notifier).value = i;
              pageController.animateToPage(i,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut);
            },
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.blueGrey,
          ),
          body: SafeArea(
            child: PageView(
              controller: pageController,
              children: pages,
              onPageChanged: (i) => ref.read(indexProvider.notifier).value = i,
            ),
          ),
        ),
      ),
    );
  }
}
