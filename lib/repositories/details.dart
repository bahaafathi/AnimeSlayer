import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/models/details.dart';
import 'package:myanime/services/details.dart';
import 'package:myanime/services/ova.dart';
import 'package:myanime/utils/url.dart';

class DetailsRepository extends BaseRepository<DetailsService, Details> {
  const DetailsRepository(DetailsService service) : super(service);

  @override
  Future<Details> fetchData({@required int id, Request request}) async {
    final response = await service.getDetails(id: id, request: request);

    return Details.fromJson(response.data);
  }
}
