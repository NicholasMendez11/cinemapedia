//Guao.
import '../entities/movie.dart';

abstract class MovieRepositories {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
