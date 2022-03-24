import 'package:dartz/dartz.dart';
import 'package:flutter_test_drive/number_trivia/core/usecases/usecase.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/domain/repositories/nuber_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_drive/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:mocktail/mocktail.dart';

class MockedNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late MockedNumberTriviaRepository mockRepository;
  late GetRandomNumberTrivia useCase;

  setUp(() {
    mockRepository = MockedNumberTriviaRepository();
    useCase = GetRandomNumberTrivia(repository: mockRepository);
  });


  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the random number from the repository',
        () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(() => mockRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await useCase(NoParams());
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tNumberTrivia));
      // Verify that the method has been called on the Repository
      verify(() => mockRepository.getRandomNumberTrivia()).called(1);
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockRepository);
    },
  );
}