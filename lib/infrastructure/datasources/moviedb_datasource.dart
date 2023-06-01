//Esta implementacion es la implementacion de la clase abstracta de datasource del domain
//Esta concebido y esxiste solo para ser la conneccion a the moviedb api

import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'esp-MX'
      }));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    //La carpinteria que es la parte que mas me confundio de la arquitectura vive aqui, es simplemente limpiar la  respuesta para que temrine siendo una lista de movies
    //Para eso utiliza la carpeta de modelos y la de mappers.

    final movieDbresponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbresponse.results
        .where((moviedb) =>
            moviedb.posterPath !=
            'no-poster') //Filtramos y eleminamos de la lista las peliculas sin poster
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }

//Estudia bien esto
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcomming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) throw Exception('Movie id: $id not foung');
    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }
}
