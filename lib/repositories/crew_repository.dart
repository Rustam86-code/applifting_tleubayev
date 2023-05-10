import 'package:applifting_tleubayev/domain/domain.dart';
import 'package:dio/dio.dart';

class CrewRepository {
  final dio = Dio();
  static const url = 'https://api.spacexdata.com/v4';

  Future<List<Crew>?> getCrew() async {
    try {
      Response response = await dio.get('$url/crew');
      final data = response.data;
      if (data != null && data is List) {
        return data
            .map((json) => Crew.fromJson(json))
            // ignore: unnecessary_null_comparison
            .where((crew) => crew != null)
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (error) {
      throw Exception('Failed to load launches:$error');
    }
  }
}
