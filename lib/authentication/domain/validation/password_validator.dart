import 'package:applover/authentication/domain/validation/password_validator_failure.dart';
import 'package:dartz/dartz.dart';

import 'validator.dart';

class PasswordValidator extends Validator<PasswordValidatorFailure, String?> {
  @override
  Either<PasswordValidatorFailure, String?> validateOrFailure(String? value) {
    if (value == null || value.trim().isEmpty) {
      return left(const PasswordValidatorFailure.empty());
    }
    if (value.length < 6) {
      return left(const PasswordValidatorFailure.tooShort());
    }

    return right(value);
  }
}
