
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia{
  const NumberTriviaModel({required int number, required String text}) : super(number: number, text: text);

  factory  NumberTriviaModel.fromJson(Map<String, dynamic>? jsonMap) {
    if(jsonMap == null){
      return NumberTriviaModel(number: 1, text: "error");
    }
    return NumberTriviaModel(number: (jsonMap['number'] as num).toInt(), text: jsonMap['text']);
  }
}