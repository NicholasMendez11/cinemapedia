import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_implemtnation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repositorio es inmutable, su objetivo es proveer todo lo que estoy proporcianando dentro del datasource
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDataSource());
});
