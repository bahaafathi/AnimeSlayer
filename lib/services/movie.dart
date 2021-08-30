import 'package:dio/dio.dart';
import 'package:flutter_request_bloc/services/base.dart';
import 'package:myanime/utils/url.dart';

class MoviesService extends BaseService<Dio> {
  const MoviesService(Dio client) : super(client);

  Future<Response> getMovies() async {
    return client.get(Url.animeCategoryUrl(category: Category.movie));
  }
}
