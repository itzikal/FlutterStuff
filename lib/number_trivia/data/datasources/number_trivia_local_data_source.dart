import 'package:flutter_test_drive/number_trivia/data/models/number_tivial_model.dart';

abstract class NumberTriviaLocalDataSource{
  Future<NumberTriviaModel> getLastNumberTrivia();
  void cacheNumberTrivia(NumberTriviaModel toCache);
}
