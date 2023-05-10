import 'package:applifting_tleubayev/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShipsPage extends ConsumerWidget {
  ShipsPage({super.key});

  final filterTextProvider = StateProvider((_) => '');
  final defaultImage =
      'https://media.istockphoto.com/id/1360144439/cs/fotografie/let-raketoplánu-v-hlubokém-vesm%C3%ADru-vesm%C3%ADrná-raketa-na-oběžné-dráze-planety-země-sci-fi.jpg?s=1024x1024&w=is&k=20&c=0L74FPnb-Ln4xQ4FjyV5_GXAPoofeoWfDtOxorSqngQ=';

  @override
  Widget build(context, ref) {
    final filterText = ref.watch(filterTextProvider);
    final filteredShips = ref.watch(shipsProvider).whenData((ships) {
      if (filterText.isEmpty) {
        return ships;
      } else {
        return ships!
            .where((ship) =>
                ship.name!.toLowerCase().contains(filterText.toLowerCase()))
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
                hintText: 'Search ships',
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            Expanded(
              child: filteredShips.when(
                data: (ships) => ListView.builder(
                  itemCount: ships!.length,
                  itemBuilder: (context, index) {
                    final ship = ships[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.greenAccent.withOpacity(0.2),
                        ),
                        child: ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                            ),
                            child: Image.network(ship.image ?? defaultImage),
                          ),
                          title: Column(
                            children: [
                              Text(
                                '${ship.name}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${ship.type}',
                                style: const TextStyle(
                                    color: Colors.deepOrange,
                                    fontFamily: 'Bruno'),
                              ),
                            ],
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
