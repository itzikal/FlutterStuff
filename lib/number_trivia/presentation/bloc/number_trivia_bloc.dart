import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/failures.dart';
import 'package:flutter_test_drive/number_trivia/core/usecases/usecase.dart';
import 'package:flutter_test_drive/number_trivia/core/util/input_converter.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/domain/usecases/get_number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/presentation/bloc/number_trivia_state.dart';

import 'number_trivia_event.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final GetNumberTrivia getNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc(
      {required this.getNumberTrivia,
      required this.getRandomNumberTrivia,
      required this.inputConverter})
      : super(Empty()) {
    on<NumberTriviaEvent>((event, emit) async {
      if (event is GetNumberTriviaEvent) {
        await _getNumberTrivia(event, emit);
      }else if (event is GetRandomNumberTriviaEvent) {
        await _getRandomNumberTrivia(event, emit);
      }
    });
  }

  Future<void> _getNumberTrivia(GetNumberTriviaEvent event, Emitter<NumberTriviaState> emit) async {
     final inputEither = inputConverter.stringToUnsignedInt(event.number);
    inputEither.fold((failure) {
      emit(const Error(error: Error.INVALID_NUMBER_ERROR));
    }, (number) async {
      emit(Loading());
      final failureOrTrivia = await getNumberTrivia(number);

      _checkResult(failureOrTrivia, emit);
    });
  }

  Future<void> _getRandomNumberTrivia(GetRandomNumberTriviaEvent event, Emitter<NumberTriviaState> emit) async {
      emit(Loading());
      final failureOrTrivia = await getRandomNumberTrivia(NoParams());

      _checkResult(failureOrTrivia, emit);
  }

  void _checkResult(Either<Failure, NumberTrivia> failureOrTrivia, Emitter<NumberTriviaState> emit) {
    failureOrTrivia.fold((failed) {
      emit(Error(error: _mapFailureToMessage(failed)));
    }, (numberTrivia) => emit(Loaded(trivia: numberTrivia)));
  }

  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure : return  Error.SERVER_ERROR;
      case CacheFailure : return  Error.CACHE_ERROR;
      default: return 'Unexcpeted error';
    }
  }
}
