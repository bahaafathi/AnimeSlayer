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

class DetailsRepository extends BaseRepository<DetailsService, List<dynamic>> {
  const DetailsRepository(DetailsService service) : super(service);

  @override
  Future<List<dynamic>> fetchData({@required int id, Request request}) async {
    final response = await service.getDetails(id: id, request: request);

    final charactersStaff =
        await service.getDetails(id: id, request: Request.characters_staff);
    final episodes =
        await service.getDetails(id: id, request: Request.episodes);
    final news = await service.getDetails(id: id, request: Request.news);
    // final pictures =
    //     await service.getDetails(id: id, request: Request.pictures);
    final recommendations =
        await service.getDetails(id: id, request: Request.recommendations);
    final reviews = await service.getDetails(id: id, request: Request.reviews);

    return [
      Details.fromJson(response.data),
      Character.fromJson(charactersStaff.data),
      Episode.fromJson(episodes.data),
      News.fromJson(news.data),
      //Pictures.fromJson(pictures.data),
      Recommendation.fromJson(recommendations.data),
      Review.fromJson(reviews.data),
    ];
  }
}
