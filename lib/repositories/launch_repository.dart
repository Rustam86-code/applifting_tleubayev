import 'package:applifting_tleubayev/domain/domain.dart';
import 'package:dio/dio.dart';

class LaunchRepository {
  final dio = Dio();
  static const url = 'https://api.spacexdata.com/v5';

  Future<List<Launches>?> getLaunches() async {
    try {
      Response response = await dio.get('$url/launches');
      final data = response.data;
      if (data != null && data is List) {
        return data
            .map((json) => Launches.fromJson(json))
            // ignore: unnecessary_null_comparison
            .where((launches) => launches != null)
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (error) {
      throw Exception('Failed to load launches:$error');
    }
  }
}
