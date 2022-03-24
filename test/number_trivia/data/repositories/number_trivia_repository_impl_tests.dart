import 'package:dartz/dartz.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/exceptions.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/failures.dart';
import 'package:flutter_test_drive/number_trivia/core/platform/network_info.dart';
import 'package:flutter_test_drive/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_test_drive/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_test_drive/number_trivia/data/models/number_tivial_model.dart';
import 'package:flutter_test_drive/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/domain/repositories/nuber_trivia_repository.dart';
import 'package:flutter_test_drive/number_trivia/domain/usecases/get_number_trivia.dart';
// import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';


class MockRemoteDataSource extends Mock implements NumberTriviaRemoteDataSource{}
class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource{}
class MockNetworkInfo extends Mock implements NetworkInfo{}

void main() {
  late NumberTriviaRepository repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp((){
    mockNetworkInfo = MockNetworkInfo();
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo : mockNetworkInfo
    );
  });
  
  group('get number trivia', () {
    var tNumber = 1;
    var tNumberModel = NumberTriviaModel(number: tNumber, text: 'test text');
    NumberTrivia tNumberTrivia = tNumberModel;

    test('connected', () async{
      when(()=> mockNetworkInfo.isConnected).thenAnswer((invocation) async => true);
      await repository.getConcreteNumberTrivia(tNumber);
      verify(()=> mockNetworkInfo.isConnected).called(1);
    });

    group('when device online', (){
      setUp((){
        when(()=> mockNetworkInfo.isConnected).thenAnswer((invocation) async => true);
      });

      test('Should get remote data when device online', () async {
        when(()=> mockRemoteDataSource.getConcreteNumberTrivia(any())).thenAnswer((invocation) async => tNumberModel);

        final result = await repository.getConcreteNumberTrivia(tNumber);
        
        verify(()=> mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        expect(result, equals(Right(tNumberTrivia)));
      });
      
      test('Should store remote data when device online', () async {
        when(()=> mockRemoteDataSource.getConcreteNumberTrivia(any()))
            .thenAnswer((invocation) async => tNumberModel);

        await repository.getConcreteNumberTrivia(tNumber);

       verify(()=> mockLocalDataSource.cacheNumberTrivia(tNumberModel));
      });

      test('Should get failure  when remote throw exception', () async {
        when(()=> mockRemoteDataSource.getConcreteNumberTrivia(any())).thenThrow(ServerException());

        final result = await repository.getConcreteNumberTrivia(tNumber);

        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });
    
    group('when device offline', (){
      setUp((){
        when(()=> mockNetworkInfo.isConnected).thenAnswer((invocation) async => false);
      });
      test('Should return local data when device offline', () async {
        when(()=> mockLocalDataSource.getLastNumberTrivia())
            .thenAnswer((invocation) async => tNumberModel);

        var result = await repository.getConcreteNumberTrivia(tNumber);
        verifyZeroInteractions(mockRemoteDataSource);
        verify(()=> mockLocalDataSource.getLastNumberTrivia());
        expect(result, equals(Right(tNumberTrivia)));

      });
      test('Should return CacheError data when no cache', () async {
        when(()=> mockLocalDataSource.getLastNumberTrivia())
            .thenThrow(CacheException());

        var result = await repository.getConcreteNumberTrivia(tNumber);
        verifyZeroInteractions(mockRemoteDataSource);
        verify(()=> mockLocalDataSource.getLastNumberTrivia());
        expect(result, equals(Left(CacheFailure())));

      });
    });
  });
}