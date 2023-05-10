import 'package:applifting_tleubayev/domain/domain.dart';
import 'package:applifting_tleubayev/repositories/repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final crewProvider = FutureProvider<List<Crew>?>((ref) async {
  final repository = CrewRepository();
  return repository.getCrew();
});
