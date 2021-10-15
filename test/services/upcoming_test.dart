import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myanime/services/upcoming.dart';
import 'package:myanime/utils/url.dart';

import '../mock.dart';

main() {
  group('upcoming Services', () {
    MockClient client;
    UpcomingService service;

    setUp(() {
      client = MockClient();
      service = UpcomingService(client);
    });
    test('returns upcoming Anime data when client returns 200', () async {
      const json = ['Just a normal JSON here'];
      final response = MockResponse();

      when(response.statusCode).thenReturn(200);
      when(response.data).thenReturn(json);
      when(client.get(Url.animeCategoryUrl(category: Category.upcoming)))
          .thenAnswer((realInvocation) => Future.value(response));
      final output = await service.getUpcoming();
      expect(output.data, json);
    });
  });
}
