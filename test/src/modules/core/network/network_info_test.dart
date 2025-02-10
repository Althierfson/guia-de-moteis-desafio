import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_desafio/modules/core/network/network_info.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late NetworkInfoImpl networkInfoImpl;

  setUp(() {
    registerFallbackValue(Uri.parse("https://clients3.google.com/generate_204"));
    mockHttpClient = MockHttpClient();
    networkInfoImpl = NetworkInfoImpl(client: mockHttpClient);
  });

  test("Deve retornar verdadeiro quando uma requisição cliente for um sucesso", () async {
    // Arrage
    when(() => mockHttpClient.get(any())).thenAnswer((_) async => http.Response("", 200));

    // act
    final result = await networkInfoImpl.hasConnection;

    // Asset
    expect(result, true);
    verify(() => mockHttpClient.get(any())).called(1);
    verifyNoMoreInteractions(mockHttpClient);
  });

  test("Deve retornar verdadeiro quando apenas uma requesição funcionar", () async {
    // Arrage
    int callCount = 0;
    List<http.Response> answers = [
      http.Response("", 400),
      http.Response("", 400),
      http.Response("", 200)
    ];

    when(() => mockHttpClient.get(any())).thenAnswer((_) async => answers[callCount++]);

    // act
    final result = await networkInfoImpl.hasConnection;

    // Asset
    expect(result, true);
    verify(() => mockHttpClient.get(any())).called(3);
    verifyNoMoreInteractions(mockHttpClient);
  });
}
