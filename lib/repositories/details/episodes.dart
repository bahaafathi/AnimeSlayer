import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/details.dart';
import 'package:myanime/models/episode.dart';

import 'package:myanime/services/details.dart';
import 'package:myanime/utils/url.dart';

class EpisodesRepository extends BaseRepository<DetailsService, Episode> {
  const EpisodesRepository(DetailsService service) : super(service);

  @override
  Future<Episode> fetchData({@required int id, Request request}) async {
    final response = await service.getDetails(id: id, request: Request.episodes);

    return Episode.fromJson(response.data);
  }
}
