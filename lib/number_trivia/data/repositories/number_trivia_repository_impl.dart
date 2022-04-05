import 'package:dartz/dartz.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/exceptions.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/failures.dart';
import 'package:flutter_test_drive/number_trivia/core/platform/network_info.dart';
import 'package:flutter_test_drive/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_test_drive/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_test_drive/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/domain/repositories/nuber_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository{
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    required this.remoteDataSource, required this.localDataSource, required this.networkInfo
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number)  async {
    if(await networkInfo.isConnected) {
      try {
        var numberTrivia = await remoteDataSource.getConcreteNumberTrivia(
            number);
        localDataSource.cacheNumberTrivia(numberTrivia);
        return Right(numberTrivia);
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }else{
      try {
        var numberTrivia = await localDataSource.getLastNumberTrivia();
        return Right(numberTrivia);
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async{
    if(await networkInfo.isConnected) {
      try {
        var numberTrivia = await remoteDataSource.getRandomNumberTrivia();
        localDataSource.cacheNumberTrivia(numberTrivia);
        return Right(numberTrivia);
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }else{
      try {
        var numberTrivia = await localDataSource.getLastNumberTrivia();
        return Right(numberTrivia);
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }

}