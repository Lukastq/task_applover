import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_address_validator_failure.freezed.dart';

@freezed
class EmailAddressValidatorFailure with _$EmailAddressValidatorFailure {
  const EmailAddressValidatorFailure._();
  const factory EmailAddressValidatorFailure.empty() = _Empty;
  const factory EmailAddressValidatorFailure.invalid() = _Invalid;
}
