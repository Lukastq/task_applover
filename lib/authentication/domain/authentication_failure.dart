import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_failure.freezed.dart';

@freezed
class AuthenticationFailure with _$AuthenticationFailure {
  const AuthenticationFailure._();
  const factory AuthenticationFailure.noInternetConnection() = _NoInternetConnection;
  const factory AuthenticationFailure.invalidEmailAndPasswordCombination() = _InvalidEmailAndPasswordCombination;
  const factory AuthenticationFailure.serverError([String? message]) = _ServerError;
}