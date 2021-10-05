import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_validator_failure.freezed.dart';


/// Failures we shoud handle when validate password
@freezed
class PasswordValidatorFailure with _$PasswordValidatorFailure {
  const PasswordValidatorFailure._();
  const factory PasswordValidatorFailure.empty() = _Empty;
  const factory PasswordValidatorFailure.tooShort() = _TooShort;
}