import 'package:flutter_test_drive/number_trivia/data/models/number_tivial_model.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRemoteDataSource{
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}