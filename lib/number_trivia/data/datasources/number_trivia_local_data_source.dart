import 'dart:convert';
import 'dart:io';

import 'package:flutter_test_drive/number_trivia/core/errors/exceptions.dart';
import 'package:flutter_test_drive/number_trivia/data/models/number_tivial_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getLastNumberTrivia();

  void cacheNumberTrivia(NumberTriviaModel toCache);
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences _preferences;
  static const String _CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';
  NumberTriviaLocalDataSourceImpl(this._preferences);

  @override
  void cacheNumberTrivia(NumberTriviaModel toCache) {
     _preferences.setString(_CACHED_NUMBER_TRIVIA, toCache.toJsonString());
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonStr = _preferences.getString(_CACHED_NUMBER_TRIVIA);
    if(jsonStr == null){
      throw CacheException();
    }
    return Future.value(NumberTriviaModel.fromJson(json.decode(jsonStr)));

  }
}
