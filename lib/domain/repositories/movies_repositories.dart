//Guao.
import '../entities/movie.dart';

abstract class MovieRepositories {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<List<Movie>> getUpcomming({int page = 1});
  Future<Movie> getMovieById(String id);
}
