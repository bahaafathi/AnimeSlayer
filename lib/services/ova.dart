import 'package:dio/dio.dart';
import 'package:flutter_request_bloc/services/base.dart';
import 'package:myanime/utils/url.dart';

class OvaService extends BaseService<Dio> {
  const OvaService(Dio client) : super(client);

  Future<Response> getOva() async {
    await Future.delayed(const Duration(seconds: 3));
    print('Ova');
    return client.get(Url.animeCategoryUrl(category: Category.ova));
  }
}
