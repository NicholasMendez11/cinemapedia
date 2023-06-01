import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/actors.dart';
import 'actors_repository_provider.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actors>>>(
        (ref) {
  final actoRepository = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieNotifier(getActors: actoRepository.getActorsByMovie);
});

typedef GetActors = Future<List<Actors>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actors>>> {
  final GetActors getActors;
  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
