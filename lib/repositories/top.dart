import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/top.dart';
import 'package:myanime/services/top.dart';

/// Handles retrieve and transformation of [ComapnyInfo] from the API.
class TopRepository extends BaseRepository<TopService, TopAnime> {
  const TopRepository(TopService service) : super(service);

  @override
  Future<TopAnime> fetchData() async {
    final response = await service.getTop();

    return TopAnime.fromJson(response.data);
  }
}
