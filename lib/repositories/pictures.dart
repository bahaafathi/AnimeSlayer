import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/details.dart';
import 'package:myanime/models/pictures.dart';
import 'package:myanime/services/details.dart';
import 'package:myanime/utils/url.dart';

class PicturesRepository extends BaseRepository<DetailsService, AnimePictures> {
  const PicturesRepository(DetailsService service) : super(service);

  @override
  Future<AnimePictures> fetchData({@required int id}) async {
    final response =
        await service.getDetails(id: id, request: Request.pictures);

    return AnimePictures.fromJson(response.data);
  }
}
