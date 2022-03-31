import 'package:dartz/dartz.dart';
import 'package:flutter_test_drive/number_trivia/core/errors/failures.dart';

class InputConverter{
  Either<Failure, int> stringToUnsignedInt(String str){
    try {
      int reuslt = int.parse(str);
      if(reuslt < 0){
        return Left(NagativeInputFailure());
      }
      return Right(reuslt);
    }catch (e) {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure { }
class NagativeInputFailure extends Failure { }