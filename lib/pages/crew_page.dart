import 'package:applifting_tleubayev/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CrewPage extends ConsumerWidget {
  CrewPage({super.key});

  final filterTextProvider = StateProvider((_) => '');
  final defaultImage =
      'https://media.istockphoto.com/id/1360144439/cs/fotografie/let-raketoplánu-v-hlubokém-vesm%C3%ADru-vesm%C3%ADrná-raketa-na-oběžné-dráze-planety-země-sci-fi.jpg?s=1024x1024&w=is&k=20&c=0L74FPnb-Ln4xQ4FjyV5_GXAPoofeoWfDtOxorSqngQ=';

  @override
  Widget build(context, ref) {
    final filterText = ref.watch(filterTextProvider);
    final filteredCrews = ref.watch(crewProvider).whenData((crews) {
      if (filterText.isEmpty) {
        return crews;
      } else {
        return crews!
            .where((crew) =>
                crew.name!.toLowerCase().contains(filterText.toLowerCase()))
            .toList();
      }
    });
    return Material(
      child: Column(
        children: [
          TextField(
            onChanged: (value) =>
                ref.read(filterTextProvider.notifier).state = value,
            decoration: const InputDecoration(
              hintText: 'Search crews',
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          Expanded(
            child: filteredCrews.when(
              data: (crews) => ListView.builder(
                itemCount: crews!.length,
                itemBuilder: (context, index) {
                  final crew = crews[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.lightBlueAccent.withOpacity(0.3),
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Image.network(
                            crew.image ?? defaultImage,
                            alignment: Alignment.center,
                          ),
                        ),
                        title: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(18)),
                          child: Column(
                            children: [
                              Text(
                                '${crew.name}',
                                style: const TextStyle(fontFamily: 'Bruno'),
                              ),
                              Text(
                                '${crew.agency}',
                                style: const TextStyle(fontFamily: 'Bruno'),
                              ),
                              Text(
                                '${crew.status}',
                                style: const TextStyle(
                                    fontFamily: 'Bruno', color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        minVerticalPadding: 15,
                        style: ListTileStyle.list,
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
    );
  }
}
