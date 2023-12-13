import 'package:dio/dio.dart';
import 'package:example/api/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RhymerApiClient {
  factory RhymerApiClient(Dio dio, {String baseUrl}) = _RhymerApiClient;

  factory RhymerApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if (apiUrl != null) {
      return RhymerApiClient(dio, baseUrl: apiUrl);
    }
    return RhymerApiClient(dio);
  }

  @GET('/character/394')
  Future<Rhymes> getRhymesList(@Query("word") String word);
}
