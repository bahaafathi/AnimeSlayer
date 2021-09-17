import 'package:dio/dio.dart';
import 'package:flutter_request_bloc/services/base.dart';
import 'package:myanime/utils/url.dart';

class SpecialService extends BaseService<Dio> {
  const SpecialService(Dio client) : super(client);

  Future<Response> getSpecial() async {
   // await Future.delayed(const Duration(seconds: 2));
   print('Special');
    return client.get(Url.animeCategoryUrl(category: Category.special));
  }
}
