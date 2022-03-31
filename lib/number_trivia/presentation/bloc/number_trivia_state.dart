import 'package:equatable/equatable.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();

  @override
  List<Object> get props => [];
}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  const Loaded({required this.trivia});

  @override
  List<Object> get props => [trivia];
}


class Error extends NumberTriviaState {
  static const String  SERVER_ERROR = 'Server Failure';
  static const String  CACHE_ERROR = 'Cache Failure';
  static const String  INVALID_NUMBER_ERROR = 'Invalid Input';

  final String error;

  const Error({required this.error});

  @override
  List<Object> get props => [error];
}
