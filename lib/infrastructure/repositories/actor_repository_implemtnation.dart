import 'package:cinemapedia/domain/datasources/actor_datasource.dart';
import 'package:cinemapedia/domain/entities/actors.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorRepository {
  final ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actors>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
