import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_drive/number_trivia/core/NetworkProvider.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/exceptions.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/failures.dart';
import 'package:flutter_test_drive/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_test_drive/number_trivia/data/models/number_tivial_model.dart';
import 'package:mocktail/mocktail.dart';
import '../../../fixtures/fixture_reader.dart';
import 'package:http/http.dart' as http;

class MockNetworkProvider extends Mock implements NetworkProvider {}

void main() {
  late NumberTriviaRemoteDataSourceImpl dataSource;
  late NetworkProvider httpClient;
  setUp(() {
    httpClient = MockNetworkProvider();
    dataSource = NumberTriviaRemoteDataSourceImpl(networkProvider: httpClient);
  });

  group('get Number Trivia', () {
    const tNumber = 1;
    test('''should preform Get with 
      number and application/json''', () async {
      var uri = Uri.parse('http://numbersapi.com/1');
      var headers = {'Content-Type': 'application/json'};

      when(() => httpClient.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
      dataSource.getConcreteNumberTrivia(tNumber);

      verify(() => httpClient.get(uri, headers: headers));
    });

    test('should get trivia number from mock network', () async {
      var uri = Uri.parse('http://numbersapi.com/1');
      var headers = {'Content-Type': 'application/json'};

      when(() => httpClient.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
      var result = await dataSource.getConcreteNumberTrivia(tNumber);

      verify(() => httpClient.get(uri, headers: headers));
      expect(
          result, const NumberTriviaModel(number: 1, text: 'test for number'));
    });

    test('should throw exception when data not as expected', () async {
      var uri = Uri.parse('http://numbersapi.com/1');
      var headers = {'Content-Type': 'application/json'};

      when(() => httpClient.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response('not valid json', 200));
      try {
        var result = await dataSource.getConcreteNumberTrivia(tNumber);
      } catch (e) {
        expect(e, isA<ServerException>());
      }
    });

    test('should throw exception on Server error', () async {
      var uri = Uri.parse('http://numbersapi.com/1');
      var headers = {'Content-Type': 'application/json'};

      when(() => httpClient.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response('not valid json', 500));
      try {
        var result =  await dataSource.getConcreteNumberTrivia(tNumber);
      } catch (e) {
        expect(e, isA<ServerException>());
      }
    });
  });
  group('get random Number Trivia', () {

    test('''should preform Get with 
      number and application/json''', () async {
      var uri = Uri.parse('http://numbersapi.com/random');
      var headers = {'Content-Type': 'application/json'};

      when(() => httpClient.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
      dataSource.getRandomNumberTrivia();

      verify(() => httpClient.get(uri, headers: headers));
    });

    test('should get trivia number from mock network', () async {
      var uri = Uri.parse('http://numbersapi.com/random');
      var headers = {'Content-Type': 'application/json'};

      when(() => httpClient.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
      var result = await dataSource.getRandomNumberTrivia();

      verify(() => httpClient.get(uri, headers: headers));
      expect(
          result, const NumberTriviaModel(number: 1, text: 'test for number'));
    });

    test('should throw exception when data not as expected', () async {
      var uri = Uri.parse('http://numbersapi.com/random');
      var headers = {'Content-Type': 'application/json'};

      when(() => httpClient.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response('not valid json', 200));
      try {
        var result = await dataSource.getRandomNumberTrivia();
      } catch (e) {
        expect(e, isA<ServerException>());
      }
    });

    test('should throw exception on Server error', () async {
      var uri = Uri.parse('http://numbersapi.com/random');
      var headers = {'Content-Type': 'application/json'};

      when(() => httpClient.get(uri, headers: headers))
          .thenAnswer((_) async => http.Response('not valid json', 500));
      try {
        var result =  await dataSource.getRandomNumberTrivia();
      } catch (e) {
        expect(e, isA<ServerException>());
      }
    });
  });
}
