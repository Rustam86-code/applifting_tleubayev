import 'package:applifting_tleubayev/pages/home_page.dart';
import 'package:applifting_tleubayev/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({super.key, required this.launchId});

  final int launchId;

  static Route route({
    required int launchId,
  }) {
    return MaterialPageRoute(
      builder: (_) => DetailsPage(launchId: launchId),
    );
  }

  @override
  Widget build(context, ref) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Details',
            style: TextStyle(fontFamily: 'Bruno'),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacement(HomePage.route()),
                icon: const Icon(Icons.arrow_back_ios_new),
              );
            },
          ),
        ),
        body: SafeArea(
            minimum: const EdgeInsets.all(6),
            child: Consumer(
              builder: (context, ref, child) {
                final launchesAsync = ref.watch(launchesProvider);
                return launchesAsync.when(
                  data: (launches) {
                    late final launch = launches![launchId];
                    return Container(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          Image.network('${launch.links?.patch?.large}'),
                          Text(
                            '${launch.name}',
                            style: const TextStyle(
                                fontFamily: 'Bruno', fontSize: 20),
                          ),
                          Text('${launch.details}'),
                          Text(
                            DateFormat.yMMMEd().format(launch.dateUtc!),
                          ),
                          Text(
                            DateFormat.Hms().format(launch.dateUtc!),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (error, stackTrace) => Center(
                    child: Text('Error: $error'),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            )),
      ),
    );
  }
}
