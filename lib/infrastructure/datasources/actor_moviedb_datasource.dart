import 'package:cinemapedia/domain/datasources/actor_datasource.dart';
import 'package:cinemapedia/domain/entities/actors.dart';
import 'package:cinemapedia/infrastructure/mappers/actors_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

import '../../config/constants/environment.dart';

class ActorMovieDbDataSource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'esp-MX'
      }));
  @override
  Future<List<Actors>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    if (response.statusCode != 200) throw Exception('Actor not found');

    final castResponse = CreditsResponse.fromJson(response.data);
    final List<Actors> actors =
        castResponse.cast.map((cast) => ActorMapper.casToEntity(cast)).toList();

    return actors;
  }
}
