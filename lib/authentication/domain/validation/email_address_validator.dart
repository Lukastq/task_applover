import 'package:applover/authentication/domain/validation/email_address_validator_failure.dart';
import 'package:applover/authentication/domain/validation/validator.dart';
import 'package:dartz/dartz.dart';

class EmailAddressValidator extends Validator<EmailAddressValidatorFailure, String?> {
  @override
  Either<EmailAddressValidatorFailure, String?> validateOrFailure(String? value) {
    if (value == null || value.trim().isEmpty) {
      return left(const EmailAddressValidatorFailure.empty());
    }

    if (value.length > 320) {
      return left(const EmailAddressValidatorFailure.tooLong());
    }
    bool valid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

    if (!valid) {
      return left(const EmailAddressValidatorFailure.invalid());
    }

    return right(value);
  }
}
