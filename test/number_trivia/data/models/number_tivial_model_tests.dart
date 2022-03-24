import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_drive/number_trivia/data/models/number_tivial_model.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';

import '../../fixtures/fixture_reader.dart';

void main(){
  const tNumberTrivaModel = NumberTriviaModel(number :1, text: 'test for number');
  test('Should be subclass of numbertriva entity', () async{
    expect(tNumberTrivaModel, isA<NumberTrivia>());
  });
  group('from json', (){
    test('should return valid model when json is an integer', () async {
      final Map<String, dynamic>? jsonMap =
          json.decode(fixture('trivia.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, tNumberTrivaModel);
    });

    test('should return valid model when json is an double', () async {
      final Map<String, dynamic>? jsonMap =
      json.decode(fixture('trivia_double.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, tNumberTrivaModel);
    });
  });

}