import 'package:applover/authentication/domain/validation/email_address_validator_failure.dart';
import 'package:applover/authentication/domain/validation/password_validator_failure.dart';
import 'package:dartz/dartz.dart';

/// Returns left with email address validator failure when email is not valid, returns right when is valid.
Either<EmailAddressValidatorFailure, Unit> validateEmailAddress(String? value) {
  if (value == null || value.trim().isEmpty) {
    return left(const EmailAddressValidatorFailure.empty());
  }
  
  bool valid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

  if (!valid) {
    return left(const EmailAddressValidatorFailure.invalid());
  }

  return right(unit);
}

/// Returns left with password validator failure when password ail is not valid, returns right when is valid.
Either<PasswordValidatorFailure, Unit> validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return left(const PasswordValidatorFailure.empty());
  }
  if (value.length < 6) {
    return left(const PasswordValidatorFailure.tooShort());
  }

  return right(unit);
}
