import 'package:applifting_tleubayev/domain/domain.dart';
import 'package:dio/dio.dart';

class ShipsRepository {
  final dio = Dio();
  static const url = 'https://api.spacexdata.com/v4';

  Future<List<Ships>?> getShips() async {
    try {
      Response response = await dio.get('$url/ships');
      final data = response.data;
      if (data != null && data is List) {
        return data
            .map((json) => Ships.fromJson(json))
            // ignore: unnecessary_null_comparison
            .where((ships) => ships != null)
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (error) {
      throw Exception('Failed to load launches:$error');
    }
  }
}
