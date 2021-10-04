import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_validator_failure.freezed.dart';

@freezed
class PasswordValidatorFailure with _$PasswordValidatorFailure {
  const PasswordValidatorFailure._();
  const factory PasswordValidatorFailure.empty() = _Empty;
  const factory PasswordValidatorFailure.tooShort() = _TooShort;
}