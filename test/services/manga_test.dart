import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myanime/services/manga.dart';

import 'package:myanime/utils/url.dart';

import '../mock.dart';

main() {
  group('Manga Services', () {
    MockClient client;
    MangaService service;

    setUp(() {
      client = MockClient();
      service = MangaService(client);
    });
    test('returns manga data when client returns 200', () async {
      const json = ['Just a normal JSON here'];
      final response = MockResponse();

      when(response.statusCode).thenReturn(200);
      when(response.data).thenReturn(json);
      when(client.get(Url.mangaCategoryUrl()))
          .thenAnswer((realInvocation) => Future.value(response));
      final output = await service.getManga();
      expect(output.data, json);
    });
  });
}
