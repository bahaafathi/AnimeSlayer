import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myanime/services/special.dart';

import 'package:myanime/utils/url.dart';

import '../mock.dart';

main() {
  group('Special Services', () {
    MockClient client;
    SpecialService service;

    setUp(() {
      client = MockClient();
      service = SpecialService(client);
    });
    test('returns Special Anime data when client returns 200', () async {
      const json = ['Just a normal JSON here'];
      final response = MockResponse();

      when(response.statusCode).thenReturn(200);
      when(response.data).thenReturn(json);
      when(client.get(Url.animeCategoryUrl(category: Category.special)))
          .thenAnswer((realInvocation) => Future.value(response));
      final output = await service.getSpecial();
      expect(output.data, json);
    });
  });
}
