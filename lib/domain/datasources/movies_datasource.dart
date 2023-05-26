//El objetivo del data source del domain es que sea abstracta para no crear instancias de ella
import '../entities/movie.dart';

abstract class MovieDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
