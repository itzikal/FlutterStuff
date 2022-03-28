import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/exceptions.dart';
import 'package:flutter_test_drive/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_test_drive/number_trivia/data/models/number_tivial_model.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late NumberTriviaLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = NumberTriviaLocalDataSourceImpl(mockSharedPreferences);
  });

  group('getLastNumberTrivia', () {
    test('should get last stored trivia number', () async {
      when(() => mockSharedPreferences.getString(any()))
          .thenReturn(fixture('trivia_cached.json'));

      final result = await dataSource.getLastNumberTrivia();

      // verify(()=> mockSharedPreferences.getString(any()));
      verify(() => mockSharedPreferences.getString('CACHED_NUMBER_TRIVIA'));

      expect(result,
          equals(const NumberTriviaModel(number: 1, text: "test for number")));
    });

    test('should throw cache exception when not cachth values', () async {
      when(() => mockSharedPreferences.getString(any())).thenReturn(null);
      try {
        final call1 = await dataSource.getLastNumberTrivia();
      } catch (e) {
        expect(e, isA<CacheException>());
      }
    });
  });

  group('cache number trivia', (){
    const  toCache = NumberTriviaModel(number: 1, text: 'test text');
    test('caching number',() async {
      when(()=> mockSharedPreferences.setString(any(), any())).thenAnswer((invocation) async => true);
       dataSource.cacheNumberTrivia(toCache);

       verify(()=> mockSharedPreferences.setString('CACHED_NUMBER_TRIVIA', toCache.toJsonString()));
    });
  });
}
