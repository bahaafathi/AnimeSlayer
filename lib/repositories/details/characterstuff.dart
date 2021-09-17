import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/characters.dart';
import 'package:myanime/models/details.dart';
import 'package:myanime/models/recommendation.dart';
import 'package:myanime/models/review.dart';

import 'package:myanime/services/details.dart';
import 'package:myanime/utils/url.dart';

class CharactersStaffRepository
    extends BaseRepository<DetailsService, Character> {
  const CharactersStaffRepository(DetailsService service) : super(service);

  @override
  Future<Character> fetchData({@required int id, Request request}) async {
    final response =
        await service.getDetails(id: id, request: Request.characters_staff);

    return Character.fromJson(response.data);
  }
}
