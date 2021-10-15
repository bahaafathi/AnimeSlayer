
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myanime/services/top.dart';
import 'package:myanime/utils/url.dart';

import '../mock.dart';

main() {
  group('Top unit', () {
    MockClient client;
    TopService service;

    setUp(() {
      client = MockClient();
      service = TopService(client);
    });
    test('returns top Anime data when client returns 200', () async {
      const json = ['Just a normal JSON here'];
      final response = MockResponse();

      when(response.statusCode).thenReturn(200);
      when(response.data).thenReturn(json);
      when(client.get(Url.animeCategoryUrl(category: Category.airing)))
          .thenAnswer((realInvocation) => Future.value(response));
      final output = await service.getTop();
      expect(output.data, json);
    });
  });
}
