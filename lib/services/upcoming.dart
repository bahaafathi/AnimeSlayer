import 'package:dio/dio.dart';
import 'package:flutter_request_bloc/services/base.dart';
import 'package:myanime/utils/url.dart';

class UpcomingService extends BaseService<Dio> {
  const UpcomingService(Dio client) : super(client);

  Future<Response> getUpcoming() async {
    return client.get(Url.animeCategoryUrl(category: Category.upcoming));
  }
}
