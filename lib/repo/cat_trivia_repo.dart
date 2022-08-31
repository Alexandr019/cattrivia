import 'package:cattrivia/repo/dto/cattrivia_item.dart';
import 'package:cattrivia/utils/time_utils.dart';
import 'package:dio/dio.dart';

class CatTriviaRepo {
  final Dio _dio;
  final TimeUtils _timeUtils;
  static const String _feedsEndpoint = '/api/randomfact';

  CatTriviaRepo(this._dio, this._timeUtils);

  Future<CatData> fetchCatTrivia() async {
    final json = await _dio.get(_feedsEndpoint);

    final data = json.data;

    return CatData.fromJson(data, _timeUtils.currentDateTime());
  }
}
