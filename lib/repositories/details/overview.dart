import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/characters.dart';
import 'package:myanime/models/details.dart';
import 'package:myanime/models/episode.dart';
import 'package:myanime/models/news.dart';
import 'package:myanime/models/pictures.dart';
import 'package:myanime/models/recommendation.dart';
import 'package:myanime/models/review.dart';
import 'package:myanime/services/details.dart';
import 'package:myanime/utils/url.dart';

class OverViewRepository extends BaseRepository<DetailsService, Details> {
  const OverViewRepository(DetailsService service) : super(service);

  @override
  Future<Details> fetchData({@required int id, Request request}) async {
    final response = await service.getDetails(id: id, request: request);

    return Details.fromJson(response.data);
  }
}
