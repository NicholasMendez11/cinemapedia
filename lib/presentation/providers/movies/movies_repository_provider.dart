import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_implamentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repositorio es inmutable, su objetivo es proveer todo lo que estoy proporcianando dentro del datasource
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImp(MoviedbDatasource());
});
