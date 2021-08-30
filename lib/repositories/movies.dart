import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/movies.dart';
import 'package:myanime/services/movie.dart';

/// Handles retrieve and transformation of [ComapnyInfo] from the API.
class MoviesRepository extends BaseRepository<MoviesService, Movies> {
  const MoviesRepository(MoviesService service) : super(service);

  @override
  Future<Movies> fetchData() async {
    final response = await service.getMovies();

    return Movies.fromJson(response.data);
  }
}
