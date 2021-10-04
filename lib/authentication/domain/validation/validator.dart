import 'package:dartz/dartz.dart';

/// [F] for failure type
/// [T] for input type
abstract class Validator<F, T> {
  Either<F, T>  validateOrFailure(T value);
}