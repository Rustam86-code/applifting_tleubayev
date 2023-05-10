import 'package:applifting_tleubayev/domain/domain.dart';
import 'package:applifting_tleubayev/repositories/repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final launchesProvider = FutureProvider<List<Launches>?>((ref) async {
  final repository = LaunchRepository();
  return repository.getLaunches();
});
