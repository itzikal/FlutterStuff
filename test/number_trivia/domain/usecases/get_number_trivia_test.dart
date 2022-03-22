import 'package:dartz/dartz.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/domain/repositories/nuber_trivia_repository.dart';
import 'package:flutter_test_drive/number_trivia/domain/usecases/get_number_trivia.dart';
// import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockedNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late MockedNumberTriviaRepository mockRepository;
  late GetNumberTrivia useCase;

  setUp(() {
    mockRepository = MockedNumberTriviaRepository();
    useCase = GetNumberTrivia(repository: mockRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository',
        () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(()=> mockRepository.getConcreteNumberTrivia(any()))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await useCase.execute(number: tNumber);
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tNumberTrivia));
      // Verify that the method has been called on the Repository
      verify (()=> mockRepository.getConcreteNumberTrivia(tNumber)).called(1);
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockRepository);
    },
  );

  // test("should return number trivia from repository", () async {
  //   when(mockRepository.getNumberTrivia(1))
  //       .thenAnswer((_) async => const Right(NumberTrivia(number: 1, text:"any")));
  //
  //   var result = await useCase.execute(number: 1);
  //
  //   expect(result, const NumberTrivia(number: 1, text: "any"));
  // });

}
