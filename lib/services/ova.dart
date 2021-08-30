import 'package:dio/dio.dart';
import 'package:flutter_request_bloc/services/base.dart';
import 'package:myanime/utils/url.dart';

class OvaService extends BaseService<Dio> {
  const OvaService(Dio client) : super(client);

  Future<Response> getOva() async {
    return client.get(Url.animeCategoryUrl(category: Category.ova));
  }
}
