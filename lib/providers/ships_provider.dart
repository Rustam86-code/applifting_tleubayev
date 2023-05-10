import 'package:applifting_tleubayev/domain/domain.dart';
import 'package:applifting_tleubayev/repositories/repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shipsProvider = FutureProvider<List<Ships>?>((ref) async {
  final repository = ShipsRepository();
  return repository.getShips();
});
