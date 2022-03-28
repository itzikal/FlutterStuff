import 'dart:convert';

import 'package:flutter_test_drive/number_trivia/core/errors/exceptions.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/failures.dart';
import 'package:flutter_test_drive/number_trivia/data/models/number_tivial_model.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';

import '../../core/NetworkProvider.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final NetworkProvider networkProvider;

  NumberTriviaRemoteDataSourceImpl({required this.networkProvider});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getNumberTrivia('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _getNumberTrivia('http://numbersapi.com/random');

  Future<NumberTriviaModel> _getNumberTrivia(String url) async {
    try {
      var response = await networkProvider
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        return NumberTriviaModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
