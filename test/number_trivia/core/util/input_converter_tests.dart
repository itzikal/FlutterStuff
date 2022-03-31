import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_drive/number_trivia/core/util/input_converter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  var converter = InputConverter();

  group('stringToUnsignedInt', ()
  {
    test('sould return valid number', () async {
      var result = converter.stringToUnsignedInt('0');
      expect(result, const Right(0));
    });
    test('sould return valid number', () async {
      var result = converter.stringToUnsignedInt('10');
      expect(result, const Right(10));
    });
    test('sould return invalid on wrong number', () async {
      var result = converter.stringToUnsignedInt('abc');
      expect(result, Left(InvalidInputFailure()));
    });
    test('sould return invalid on nagative number', () async {
      var result = converter.stringToUnsignedInt('-10');
      expect(result, Left(NagativeInputFailure()));
    });
  });
}