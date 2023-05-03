import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_with_http_searcher/provider/provider.dart';
import 'package:flutter_with_http_searcher/widgets/widgets.dart';
import 'package:flutter_with_http_searcher/widgets/widgets.dart';

import '../pages/past_launches_page.dart';
import '../pages/upcoming_launches_page.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const FocusAbsorber(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: AppButtonNavigationBar(),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              PastLaunchesPage(),
              UpcomingLaunchesPage(),
            ],
          ),
        ),
      ),
    );
  }
}