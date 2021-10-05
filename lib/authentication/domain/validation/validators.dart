import 'package:applover/authentication/domain/validation/email_address_validator_failure.dart';
import 'package:applover/authentication/domain/validation/password_validator_failure.dart';
import 'package:dartz/dartz.dart';


typedef EmailAddressValidator = Either<EmailAddressValidatorFailure, Unit> Function(String? value);
typedef PasswordValidator = Either<PasswordValidatorFailure, Unit> Function(String? value);

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

Either<PasswordValidatorFailure, Unit> validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return left(const PasswordValidatorFailure.empty());
  }
  if (value.length < 6) {
    return left(const PasswordValidatorFailure.tooShort());
  }

  return right(unit);
}
