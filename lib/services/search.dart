import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/services/base.dart';
import 'package:myanime/utils/url.dart';

class SearchService extends BaseService<Dio> {
  const SearchService(Dio client) : super(client);

  Future<Response> getSearch({@required String query}) async {
    return client.get(Url.search(query: query));
  }
}
