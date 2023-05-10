import 'package:applifting_tleubayev/pages/details_page.dart';
import 'package:applifting_tleubayev/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LaunchesPage extends ConsumerWidget {
  LaunchesPage({super.key});

  static const routeName = '/allLaunches';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => LaunchesPage(),
    );
  }

  final filterTextProvider = StateProvider((_) => '');
  final defaultImage =
      'https://media.istockphoto.com/id/1360144439/cs/fotografie/let-raketoplánu-v-hlubokém-vesm%C3%ADru-vesm%C3%ADrná-raketa-na-oběžné-dráze-planety-země-sci-fi.jpg?s=1024x1024&w=is&k=20&c=0L74FPnb-Ln4xQ4FjyV5_GXAPoofeoWfDtOxorSqngQ=';

  @override
  Widget build(context, ref) {
    final filterText = ref.watch(filterTextProvider);
    final filteredLaunches = ref.watch(launchesProvider).whenData((launches) {
      if (filterText.isEmpty) {
        return launches;
      } else {
        return launches!
            .where((launch) =>
                launch.name!.toLowerCase().contains(filterText.toLowerCase()))
            .toList();
      }
    });
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TextField(
              onChanged: (value) =>
                  ref.read(filterTextProvider.notifier).state = value,
              decoration: const InputDecoration(
                hintText: 'Search launches',
                hintStyle: TextStyle(fontFamily: 'Bruno'),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            Expanded(
              child: filteredLaunches.when(
                data: (launches) => ListView.builder(
                  itemCount: launches!.length,
                  itemBuilder: (context, index) {
                    late final launch = launches[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        child: ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Image.network(
                                launch.links?.patch?.small ?? defaultImage),
                          ),
                          title: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '${launch.name}',
                              style: const TextStyle(fontFamily: 'Bruno'),
                            ),
                          ),
                          minVerticalPadding: 30,
                          style: ListTileStyle.list,
                          onTap: () => Navigator.of(context).pushReplacement(
                            DetailsPage.route(launchId: index),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                error: (error, stackTrace) => Center(
                  child: Text('Error: $error'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
