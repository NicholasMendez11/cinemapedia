import '../entities/actors.dart';

abstract class ActorRepository {
  Future<List<Actors>> getActorsByMovie(String movieId);
}
