import 'package:flutter_request_bloc/repositories/base.dart';
import 'package:myanime/models/top.dart';
import 'package:myanime/models/upcoming.dart';
import 'package:myanime/services/top.dart';
import 'package:myanime/services/upcoming.dart';

/// Handles retrieve and transformation of [ComapnyInfo] from the API.
class UpcomingRepository extends BaseRepository<UpcomingService, Upcoming> {
  const UpcomingRepository(UpcomingService service) : super(service);

  @override
  Future<Upcoming> fetchData() async {
    final response = await service.getUpcoming();

    return Upcoming.fromJson(response.data);
  }
}
