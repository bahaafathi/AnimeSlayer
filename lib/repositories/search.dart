import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/models/search.dart';
import 'package:myanime/services/ova.dart';
import 'package:myanime/services/search.dart';

class SearchRepository extends BaseRepository<SearchService, Search> {
  const SearchRepository(SearchService service) : super(service);

  @override
  Future<Search> fetchData({@required String query}) async {
    final response = await service.getSearch(query: query);

    return Search.fromJson(response.data);
  }
}
