import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/services/movie.dart';

/// Handles retrieve and transformation of [ComapnyInfo] from the API.
class MoviesRepository extends BaseRepository<MoviesService, CategoryModel> {
  const MoviesRepository(MoviesService service) : super(service);

  @override
  Future<CategoryModel> fetchData() async {
    final response = await service.getMovies();

    return CategoryModel.fromJson(response.data);
  }
}
