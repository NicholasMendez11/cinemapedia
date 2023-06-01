import 'package:cinemapedia/domain/entities/actors.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actors casToEntity(Cast cast) => Actors(
      id: cast.id,
      name: cast.name,
      profilepath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://bitslog.files.wordpress.com/2013/01/unknown-person1.gif',
      character: cast.character);
}
