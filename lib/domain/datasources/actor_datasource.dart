import '../entities/actors.dart';

abstract class ActorsDatasource {
  Future<List<Actors>> getActorsByMovie(String movieId) async {
    return [];
  }
}
