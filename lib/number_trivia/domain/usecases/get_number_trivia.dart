import 'package:dartz/dartz.dart';
import 'package:flutter_test_drive/number_trivia/core/usecases/usecase.dart';

import '../../core/errors/failures.dart';
import '../entities/number_trivia.dart';
import '../repositories/nuber_trivia_repository.dart';

class GetNumberTrivia implements UseCase<NumberTrivia, int>{
  final NumberTriviaRepository repository;

  GetNumberTrivia({required this.repository});

  @override
  Future<Either<Failure, NumberTrivia>> call(int number) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}