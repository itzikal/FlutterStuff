import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/failures.dart';
import 'package:flutter_test_drive/number_trivia/core/usecases/usecase.dart';
import 'package:flutter_test_drive/number_trivia/core/util/input_converter.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/domain/usecases/get_number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_test_drive/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:flutter_test_drive/number_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockGetNumberTrivia extends Mock implements GetNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  late MockGetRandomNumberTrivia getRandomNumberTrivia;
  late MockGetNumberTrivia getNumberTrivia;
  late MockInputConverter inputConverter;
  late NumberTriviaBloc bloc;
  setUpAll(() {
    registerFallbackValue(NoParams());
  });

  setUp(() {
    getRandomNumberTrivia = MockGetRandomNumberTrivia();
    getNumberTrivia = MockGetNumberTrivia();
    inputConverter = MockInputConverter();
    bloc = NumberTriviaBloc(
        getNumberTrivia: getNumberTrivia,
        getRandomNumberTrivia: getRandomNumberTrivia,
        inputConverter: inputConverter);
  });

  tearDown(() {
    bloc.close();
  });

  test('Initial state should be empty', () async {
    expect(bloc.state, equals(Empty()));
  });

  group('GetTriviaNumber', () {
    const String tNumberString = '1';
    const int tNumberParsed = 1;
    const NumberTrivia tNumberTrivia =
        NumberTrivia(number: 1, text: 'test text');

    test('Should call input converter to validate and convert', () async {
      //arrange
      when(() => inputConverter.stringToUnsignedInt(any()))
          .thenReturn(const Right(tNumberParsed));
      when(() => getNumberTrivia(any()))
          .thenAnswer((_) async => const Right(tNumberTrivia));
      //act
      bloc.add(const GetNumberTriviaEvent(number: tNumberString));
      await untilCalled(() => inputConverter.stringToUnsignedInt(any()));
      //assert
      verify(() => inputConverter.stringToUnsignedInt(tNumberString));
    });

    blocTest<NumberTriviaBloc, NumberTriviaState>('test invalid number input',
        build: () => bloc,
        setUp: () => when(() => inputConverter.stringToUnsignedInt(any()))
            .thenReturn(Left(NagativeInputFailure())),
        act: (bloc) =>
            bloc.add(const GetNumberTriviaEvent(number: tNumberString)),
        wait: const Duration(milliseconds: 300),
        expect: () => [const Error(error: Error.INVALID_NUMBER_ERROR)]);

    blocTest<NumberTriviaBloc, NumberTriviaState>(
        'should get number trivia from usecase',
        build: () => bloc,
        setUp: () {
          when(() => inputConverter.stringToUnsignedInt(any()))
              .thenReturn(const Right(tNumberParsed));
          when(() => getNumberTrivia(any()))
              .thenAnswer((_) async => const Right(tNumberTrivia));
        },
        act: (bloc) =>
            bloc.add(const GetNumberTriviaEvent(number: tNumberString)),
        wait: const Duration(milliseconds: 300),
        verify: (_) {
          verify(() => getNumberTrivia(tNumberParsed));
        },
        expect: () => [Loading(), Loaded(trivia: tNumberTrivia)]);

    blocTest<NumberTriviaBloc, NumberTriviaState>(
        'should failed on server error',
        build: () => bloc,
        setUp: () {
          when(() => inputConverter.stringToUnsignedInt(any()))
              .thenReturn(const Right(tNumberParsed));
          when(() => getNumberTrivia(any()))
              .thenAnswer((_) async =>  Left(ServerFailure()));
        },
        act: (bloc) =>
            bloc.add(const GetNumberTriviaEvent(number: tNumberString)),
        wait: const Duration(milliseconds: 300),
        verify: (_) {
          verify(() => getNumberTrivia(tNumberParsed));
        },
        expect: () => [Loading(), const Error(error: Error.SERVER_ERROR)]);

    blocTest<NumberTriviaBloc, NumberTriviaState>(
        'should failed on cache error',
        build: () => bloc,
        setUp: () {
          when(() => inputConverter.stringToUnsignedInt(any()))
              .thenReturn(const Right(tNumberParsed));
          when(() => getNumberTrivia(any()))
              .thenAnswer((_) async =>  Left(CacheFailure()));
        },
        act: (bloc) =>
            bloc.add(const GetNumberTriviaEvent(number: tNumberString)),
        wait: const Duration(milliseconds: 300),
        verify: (_) {
          verify(() => getNumberTrivia(tNumberParsed));
        },
        expect: () => [Loading(), const Error(error: Error.CACHE_ERROR)]);

  });

  group('GetRandromTriviaNumber', () {
    const NumberTrivia tNumberTrivia =
    NumberTrivia(number: 1, text: 'test text');

    blocTest<NumberTriviaBloc, NumberTriviaState>(
        'should get number trivia from usecase',
        build: () => bloc,
        setUp: () {
          when(() => getRandomNumberTrivia(any()))
              .thenAnswer((_) async => const Right(tNumberTrivia));
        },
        act: (bloc) =>
            bloc.add(const GetRandomNumberTriviaEvent()),
        wait: const Duration(milliseconds: 300),
        verify: (_) {
          verify(() => getRandomNumberTrivia(any()));
        },
        expect: () => [Loading(), const Loaded(trivia: tNumberTrivia)]);

    blocTest<NumberTriviaBloc, NumberTriviaState>(
        'should failed on server error',
        build: () => bloc,
        setUp: () {

          when(() => getRandomNumberTrivia(any()))
              .thenAnswer((_) async =>  Left(ServerFailure()));
        },
        act: (bloc) =>
            bloc.add(const GetRandomNumberTriviaEvent()),
        wait: const Duration(milliseconds: 300),
        verify: (_) {
          verify(() => getRandomNumberTrivia(any()));
        },
        expect: () => [Loading(), const Error(error: Error.SERVER_ERROR)]);

    blocTest<NumberTriviaBloc, NumberTriviaState>(
        'should failed on cache error',
        build: () => bloc,
        setUp: () {
          when(() => getRandomNumberTrivia(any()))
              .thenAnswer((_) async =>  Left(CacheFailure()));
        },
        act: (bloc) =>
            bloc.add(const GetRandomNumberTriviaEvent()),
        wait: const Duration(milliseconds: 300),
        verify: (_) {
          verify(() => getRandomNumberTrivia(NoParams()));
        },
        expect: () => [Loading(), const Error(error: Error.CACHE_ERROR)]);

  });
}
