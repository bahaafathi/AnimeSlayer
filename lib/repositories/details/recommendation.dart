import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/details.dart';
import 'package:myanime/models/recommendation.dart';
import 'package:myanime/models/review.dart';

import 'package:myanime/services/details.dart';
import 'package:myanime/utils/url.dart';

class RecomendationsRepository extends BaseRepository<DetailsService, Recommendation> {
  const RecomendationsRepository(DetailsService service) : super(service);

  @override
  Future<Recommendation> fetchData({@required int id, Request request}) async {
    final response = await service.getDetails(id: id, request: Request.recommendations);

    return Recommendation.fromJson(response.data);
  }
}
