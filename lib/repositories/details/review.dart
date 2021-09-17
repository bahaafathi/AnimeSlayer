import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/details.dart';
import 'package:myanime/models/review.dart';

import 'package:myanime/services/details.dart';
import 'package:myanime/utils/url.dart';

class ReviewsRepository extends BaseRepository<DetailsService, Review> {
  const ReviewsRepository(DetailsService service) : super(service);

  @override
  Future<Review> fetchData({@required int id, Request request}) async {
    final response = await service.getDetails(id: id, request: Request.reviews);

    return Review.fromJson(response.data);
  }
}
