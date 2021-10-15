import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myanime/services/details.dart';

import 'package:myanime/utils/url.dart';

import '../mock.dart';

main() {
  group('Details Services', () {
    MockClient client;
    DetailsService service;

    setUp(() {
      client = MockClient();
      service = DetailsService(client);
    });
    test('returns Details Anime data when client returns 200', () async {
      const json = ['Just a normal JSON here'];
      final response = MockResponse();

      when(response.statusCode).thenReturn(200);
      when(response.data).thenReturn(json);
      when(client.get(Url.animeDetailsUrl(id: 1)))
          .thenAnswer((realInvocation) => Future.value(response));
      final output = await service.getDetails(id: 1);
      expect(output.data, json);
    });
  });
}
