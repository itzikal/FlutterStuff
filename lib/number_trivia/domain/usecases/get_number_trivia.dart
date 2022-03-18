import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/number_trivia.dart';
import '../repositories/nuber_trivia_repository.dart';

class GetNumberTrivia{
  final NumberTriviaRepository repository;

  GetNumberTrivia({required this.repository});

  Future<NumberTrivia> execute({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}