import 'package:flutter_test/flutter_test.dart';
import 'package:lord_repository/lord_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  final mockClient = MockClient();
  final repository = FirebaseCardRepository(client: mockClient);

  group('RtdbRepository - getAllCards -', () {
    void arrangeRequestReturnSuccessfullHttpCallWithStatusCode200() {
      when(() => mockClient.get(Uri.parse(
              '${FirebaseCardRepository.url}.json$FirebaseCardRepository')))
          .thenAnswer(
        (_) async {
          return http.Response(
              '{"-0": {"edition": 2,"name": "Théodred","type": "Héros","nbCopies": 1, "sphere": "Commandement", "imageUrl": "http.png"},"-1": {"edition": 3,"name": "Glóin","type": "Héros","nbCopies": 1, "sphere": "Commandement", "imageUrl": "http.png"}}',
              200);
        },
      );
    }

    void arrangeRequestThrowsAnHttpExceptionWhenPageNotFound() {
      when(() => mockClient.get(Uri.parse(
              '${FirebaseCardRepository.url}.json$FirebaseCardRepository')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
    }

    test('on successful http call return a list of Cards', () async {
      arrangeRequestReturnSuccessfullHttpCallWithStatusCode200();
      final cards = await repository.getAllCards();
      expect(cards, isA<List<Card>>());
    });

    test('throws an http Exception if page not found', () async {
      arrangeRequestThrowsAnHttpExceptionWhenPageNotFound();
      try {
        await repository.getAllCards();
      } catch (errorMsg) {
        expect(errorMsg, 'Page non trouvée');
      }
    });
  });
}
