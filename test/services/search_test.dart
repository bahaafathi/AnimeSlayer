import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myanime/services/search.dart';

import 'package:myanime/utils/url.dart';

import '../mock.dart';

main() {
  group('Search Services', () {
    MockClient client;
    SearchService service;

    setUp(() {
      client = MockClient();
      service = SearchService(client);
    });
    test('returns Search data when client returns 200', () async {
      const json = ['Just a normal JSON here'];
      final response = MockResponse();

      when(response.statusCode).thenReturn(200);
      when(response.data).thenReturn(json);
      when(client.get(Url.search(query: 'xxx')))
          .thenAnswer((realInvocation) => Future.value(response));
      final output = await service.getSearch(query: 'xxx');
      expect(output.data, json);
    });
  });
}
