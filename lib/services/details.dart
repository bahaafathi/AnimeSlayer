import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_request_bloc/services/base.dart';
import 'package:myanime/utils/url.dart';

class DetailsService extends BaseService<Dio> {
  const DetailsService(
    Dio client,
  ) : super(client);

  Future<Response> getDetails({@required int id, Request request}) async {
    print(Url.animeDetailsUrl(id: id, request: request));
    //await Future.delayed(const Duration(milliseconds: 500));
    return client.get(Url.animeDetailsUrl(id: id, request: request));
  }
}
